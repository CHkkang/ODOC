from __future__ import division
import time
import torch
import torch.nn as nn
from torch.autograd import Variable
import numpy as np
import cv2
from videoMake.util import *
from videoMake.darknet import Darknet
import pickle as pkl
import pandas as pd
import random
from color import color
from videoMake.clothClassification import *

personNum = 1
classes = load_classes("videoMake/data/coco.names")
# 몇분할 할껀지 이거 숫자 변경해주면 됨
default_divisionNum = 1
# 욜로 분할 - ( 5 주면 1욜로+4건너뜀)
default_yoloNum = 5
classifyModels = []


def videoMakeWithYolo(exStr, models, complete=0, lock=False):
    # kind에따라 찾을 물체를 정함. (ex :  person=0, dog=16)
    inputString = exStr.split('&')

    # coco.names 에 담긴 정보로 string -> index 치환 :: 이 정보로 yolo detect 함.
    if inputString[0] != "-1":
        kind = classes.index(inputString[0])
    else:
        kind = -1

    # 모델 미리 로드된거 배열로 받음
    model = models[0]
    if len(models) >= 2:
        classifyModels.append(models[1])
        # classifyModels.append(models[2])

    if kind == 0:
        top = inputString[1]
        bottom = inputString[2]
        upperHexCode = inputString[3]
        lowerHexCode = inputString[4]
    filename = inputString[len(inputString) - 1]
    videofile = "./inputvideo/" + filename + ".mp4"
    # videofile = "./inputvideo/" + filename + ".avi"

    num_classes = 80
    bs = 1
    confidence = 0.5
    nms_thresh = 0.4
    reso = 416

    batch_size = int(bs)
    confidence = float(confidence)
    nms_thesh = float(nms_thresh)
    start = 0
    CUDA = torch.cuda.is_available()
    inp_dim = int(model.net_info["height"])
    assert inp_dim % 32 == 0
    assert inp_dim > 32


    # Detection phase
    print(videofile)

    cap = cv2.VideoCapture(videofile)
    #cap.set(cv2.CV_CAP_PROP_FOURCC, cv2.CV_FOURCC('H','2','6','4'))
    # cap = cv2.VideoCapture(0) # for webcam

    assert cap.isOpened(), 'Cannot capture source'

    default_fps = int(cap.get(cv2.CAP_PROP_FPS))
    print(default_fps)
    start = time.time()

    frameCount = 0
    framesForVideo = []
    totalFrame = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
    frameStepForSave = int(totalFrame / default_divisionNum)
    frameBreakForSave = int(totalFrame / default_divisionNum)

    print("step ", frameStepForSave)
    print("break ", frameBreakForSave)
    print("total ", totalFrame)

    yoloCounting = 0
    timeChecker = []

    while cap.isOpened():
        ret, frame = cap.read()

        # 진행도에 따라 중간중간 저장하는 코드
        if frameCount == frameBreakForSave:
            # 분할 했을때 몇번째 시작점, 종료점 필요함.
            # 전체 비디오 저장할거면. convert_ 변수 사용.
            # convert_start = frameBreakForSave - frameStepForSave
            # convert_end = frameBreakForSave
            convert_start = 0
            convert_end = len(framesForVideo)
            convert_step = int(frameBreakForSave / frameStepForSave)

            print("convert_step ", convert_step)
            print("convert_end ", convert_end)
            print("convert_start ", convert_start)

            # 전송스레드 , 욜로스레드 - 공유변수, 락
            # 메소드 호출시 락 주면 서버있는거고 안주면 걍 욜로 실행(서버아님)
            if lock:
                lock.acquire()
                try:
                    print("Save (Server True)")
                    complete[0] = complete[0] + 2
                    print("++complete : ", complete[0])
                    stepDetectTimeToTxt(timeChecker, convert_step, filename)
                    #timeChecker.clear()
                    stepFrameToVideo(framesForVideo, convert_start, convert_end - 1, convert_step, filename,
                                     fps=default_fps)
                    framesForVideo.clear()
                finally:
                    lock.release()
            else:
                print("Save (Server False)")
                stepDetectTimeToTxt(timeChecker, convert_step, filename)
                #timeChecker.clear()
                stepFrameToVideo(framesForVideo, convert_start, convert_end - 1, convert_step, filename,
                                 fps=default_fps)
                framesForVideo.clear()
            frameBreakForSave += frameStepForSave
            # if convert_step == 3:
            #    exit(0)

        if ret:
            # 초당 30 -> 30이지만 욜로는 초당 6만 할거임.
            if yoloCounting == 0:
                yoloCounting += 1

                img = prep_image(frame, inp_dim)
                #        cv2.imshow("a", frame)
                im_dim = frame.shape[1], frame.shape[0]
                im_dim = torch.FloatTensor(im_dim).repeat(1, 2)

                if CUDA:
                    im_dim = im_dim.cuda()
                    img = img.cuda()

                with torch.no_grad():
                    # output = model(Variable(img, volatile=True), CUDA)
                    output = model(Variable(img, requires_grad=True), CUDA)
                output = write_results(output, kind, confidence, num_classes, nms_conf=nms_thesh)

                if type(output) == int:
                    frameCount += 1
                    print("FPS of the video is {:5.4f}".format(
                        frameCount / (time.time() - start)) + " Yolo Not Founded F.C = " + str(frameCount))
                    # cv2.imshow("frame", frame)
                    framesForVideo.append(frame)
                    key = cv2.waitKey(1)

                    if key & 0xFF == ord('q'):
                        break
                    continue

                im_dim = im_dim.repeat(output.size(0), 1)
                scaling_factor = torch.min(416 / im_dim, 1)[0].view(-1, 1)

                output[:, [1, 3]] -= (inp_dim - scaling_factor * im_dim[:, 0].view(-1, 1)) / 2
                output[:, [2, 4]] -= (inp_dim - scaling_factor * im_dim[:, 1].view(-1, 1)) / 2

                output[:, 1:5] /= scaling_factor

                for i in range(output.shape[0]):
                    output[i, [1, 3]] = torch.clamp(output[i, [1, 3]], 0.0, im_dim[i, 0])
                    output[i, [2, 4]] = torch.clamp(output[i, [2, 4]], 0.0, im_dim[i, 1])

                # classes = load_classes('videoMake/data/coco.names')
                # colors = pkl.load(open("videoMake/pallete", "rb"))

                # output = 1프레임의 욜로 결과 배열.      ex) 3개발견 0] dog   1]  cat  2] person
                # findRes = 1프레임의 욜로 결과 사람인지? ex) 3개발견 0] false 1] false 2] true
                if kind == 0:
                    findRes = list(map(lambda x: cutPerson(x, frame, upperHexCode, lowerHexCode, top, bottom), output))
                else:
                    list(map(lambda x: cutNotPerson(x, frame), output))
            # 욜로 + 건너뛰는프레임  <- 이거 구분. else 는 건너뛰는 부분임.
            else:
                yoloCounting += 1
                yoloCounting %= default_yoloNum

            # 색, 상하종류 적용 X if문
            '''
            if type(output) != int:
                # type == int => 뜻은 욜로 아무것도 못찾았다임
                timeChecker.append(int(cap.get(cv2.CAP_PROP_POS_MSEC) / 1000))
                list(map(lambda x: write(x, frame), output))
            '''
            # 위랑 밑에 주석 바꾸셈. 위 = 색적용X , 밑= 색적용O

            # 입력 종류(dog or person)에 따라 거른 욜로 결과를 프레임에 그림
            if type(output) != int:
                # type == int => 뜻은 욜로 아무것도 못찾았다임
                for i, out in enumerate(output):
                    if findRes[i]:
                        timeChecker.append(int(cap.get(cv2.CAP_PROP_POS_MSEC) / 1000))
                        # 강찬혁병신
                        write(out, frame)

            framesForVideo.append(frame)

            key = cv2.waitKey(1)
            if key & 0xFF == ord('q'):
                break
            frameCount += 1
            # print(time.time() - start)

            # if frameCount % 5 == 0:
            print("FPS of the video is {:5.2f}".format(frameCount / (time.time() - start)) + str(" FrameCount ") + str(
                frameCount))
        else:
            print(" 동영상 종료.")
            break
    print("Total Time : ", (time.time() - start))
    # 전체 비디오 저장. while 위에 convert_start & end 확인 하셈.
    # frameToWholeVideo(framesForVideo, fps=default_fps)
    # frameToVideo(framesForVideo, 5)


def write(x, results):
    c1 = tuple(x[1:3].int())
    c2 = tuple(x[3:5].int())
    img = results
    cls = int(x[-1])
    # color = random.choice(colors)
    color = (255, 0, 0)
    # label1 은 클래스가 뭔지 label2는 확률나오는거
    label1 = "{0}".format(classes[cls])
    label2 = float("{0:0.4f}".format((x[5])))
    # label2 = torch.item(float((x[5])[cls]))

    # label = label1 + str(label2)
    label = label1

    cv2.rectangle(img, c1, c2, color, 1)  # 객체 네모칸 쳐주는 코드
    t_size = cv2.getTextSize(label, cv2.FONT_ITALIC, 0.3, 1)[0]  # 폰트 바꾸는 코드
    # c2 = c1[0] + t_size[0] + 3, c1[1] + t_size[1] + 4
    # person 만 나오게 사이즈 조절함.
    c2 = c1[0] + t_size[0], c1[1] - t_size[1]

    cv2.rectangle(img, c1, c2, color, -1)  # 글자 네모칸 쳐주는 코드
    # cv2.putText(img, label, (c1[0], c1[1] + t_size[1] + 4), cv2.FONT_ITALIC, 1, [225, 255, 255], 1);
    cv2.putText(img, label, (c1[0], c1[1]), cv2.FONT_ITALIC, 0.3, [225, 255, 255], 1);
    return img


def cutNotPerson(x, img):
    c1 = tuple(x[1:3].int())
    c2 = tuple(x[3:5].int())
    x, y = c1
    x_max, y_max = c2
    w = x_max - x
    h = y_max - y
    img_cut = img[y:y + h, x:x + w]
    global personNum
    path = "./cuttednotperson/test" + str(personNum) + ".jpg"
    personNum += 1
    cv2.imwrite(path, img_cut)


# 이미지에서 좌표로 박스 자름
def cutPerson(x, img, upperHexCode, lowerHexCode, top, bottom):
    c1 = tuple(x[1:3].int())
    c2 = tuple(x[3:5].int())
    x, y = c1
    x_max, y_max = c2
    w = x_max - x
    h = y_max - y
    img_cut = img[y:y + h, x:x + w]

    global personNum
    path = "./cuttedperson/person" + str(personNum) + ".jpg"
    upperPath = "./cuttedupper/upper" + str(personNum) + ".jpg"
    lowerPath = "./cuttedlower/lower" + str(personNum) + ".jpg"

    upperFind, cutToUpper = cutUpperBody(img_cut, upperHexCode)
    if not bool(upperFind):
        return False

    lowerFind, cutToLower = cutLowerBody(img_cut, lowerHexCode)
    if not bool(lowerFind):
        return False

    # 상의 하의 종류 구분 보류.
    # upperFind = classification(cutToUpper, top, classifyModels[0], flag = 0)
    # if not bool(upperFind):
    #     return False

    # lowerFind = classification(cutToLower, bottom, classifyModels[1], flag = 1)
    # if not bool(lowerFind):
    #     return False

    cv2.imwrite(path, img_cut)

    cv2.imwrite(upperPath, cutToUpper)
    cv2.imwrite(lowerPath, cutToLower)

    personNum += 1

    return True


def classification(cutImg, cloth, model, flag):
    find = predict(cutImg, cloth, model, flag)
    if not find:
        return int(0), ""
    return int(1)


def cutUpperBody(img, upperHexCode):
    img_h = img.shape[0]
    img_w = img.shape[1]
    cutToUpper = img[int((img_h / 10) * 1): int((img_h / 10) * 6), : img_w]
    # global upperHexCode
    find = color(upperHexCode, cutToUpper)
    if not find:
        return int(0), ""
    # print("Upper True")
    return int(1), cutToUpper


def cutLowerBody(img, lowerHexCode):
    img_h = img.shape[0]
    img_w = img.shape[1]
    cutToLower = img[int((img_h / 10) * 5): img_h, : img_w]

    # global lowerHexCode
    find = color(lowerHexCode, cutToLower)
    if not find:
        return int(0), ""
    # print("Lower True")
    return int(1), cutToLower


# 발견된 시간 텍스트로 저장
def stepDetectTimeToTxt(timeChecker, step, pathName, pathDir="./yoloresult"):
    # list_a = list(map(int, list_a))
    timeChecker = list(set(timeChecker))
    timeChecker.sort()
    pathOut = pathDir + '/' + pathName + str(step) + '.txt'
    f = open(pathOut, 'w+')
    f.write(str(timeChecker))
    f.close()


# 영상 중간중간 yolo 결과로 저장 하는 메소드
def stepFrameToVideo(inputs, start, end, step, pathName, fps=25, pathDir="./yoloresult"):
    height, width, layers = inputs[0].shape
    size = (width, height)
    pathOut = pathDir + '/' + pathName + str(step) + '.mp4'
    # pathOut = pathDir + '/yoloed_' + str(step) + '.avi'
    # out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)
    # out = cv2.VideoWriter(pathOut, 0x00000021, fps, size)
    out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'H264'), fps, size)
    count = start
    print("inputs size =  ", len(inputs))
    print("start num = ", start)
    print("end num = ", end)
    try:
        while count < end:
            out.write(inputs[count])
            count += 1
    except:
        print("out of index on inputs")
    finally:
        out.release()


def frameToWholeVideo(inputs, fps=25, pathDir="./yoloresult"):
    height, width, layers = inputs[0].shape
    size = (width, height)
    pathOut = pathDir + '/yoloVideo.mp4'
    # pathOut = pathDir + '/yoloVideo.avi'
    # out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)avc1
    # out = cv2.VideoWriter(pathOut, 0x00000021, fps, size)
    out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'H264'), fps, size)
    for i in range(len(inputs)):
        # writing to a image array
        out.write(inputs[i])
    out.release()


def frameToVideo(inputs, cutNum, fps=25, pathDir="./yoloresult"):
    results = []
    count = 1

    height, width, layers = inputs[0].shape
    size = (width, height)

    curLen = int(float(len(inputs) / cutNum))
    cuttedLen = int(float(len(inputs) / cutNum))

    for i in range(cutNum):
        pathOut = pathDir + '/video' + str(i + 1) + '.mp4'
        out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'H264'), fps, size)
        while True:
            if count == curLen:
                break
            if count >= len(inputs):
                break
            # writing to a image array
            out.write(inputs[count])
            count += 1

            # print(count, curLen, cuttedLen)

        curLen += cuttedLen

    out.release()