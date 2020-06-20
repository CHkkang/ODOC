from __future__ import division
import time
from videoMake.util import *
from videoMake.darknet import Darknet
from ex1 import *
personNum = 1
classes = load_classes("videoMake/data/coco.names")
#classes = load_classes("videoMake/data/openimages.names")
upperHexCode= ""
lowerHexCode= ""

def exVideoMake(exStr,models):

    # kind에따라 찾을 물체를 정함. (ex :  person=0, dog=16)
    inputString = exStr.split('&')
    if inputString[0] != "-1":
        kind = classes.index(inputString[0])
    else:
        kind = -1

    # 모델 미리 로드된거 배열로 받음
    model = models[0]
    # if len(models) >= 2:
    #     classifyModels.append(models[1])
    #     classifyModels.append(models[2])

    if kind == 0:
        top = inputString[1]
        bottom = inputString[2]
        global lowerHexCode
        global upperHexCode
        upperHexCode = inputString[3]
        lowerHexCode = inputString[4]

    videofile = inputString[len(inputString)-1]
    print("kind "+ str(kind) + "videofile : " +str(videofile))
    print(type(kind))
    num_classes = 80
    bs = 1
    confidence = 0.5
    nms_thresh = 0.4

    reso = 416

    batch_size = int(bs)
    confidence = float(confidence)
    nms_thesh = float(nms_thresh)
    start = time.time()
    CUDA = torch.cuda.is_available()

    # Set up the neural network
    print("Loading network.....")
    #model = Darknet(cfgfile)
    #model.load_weights(weightsfile)
    print("Network successfully loaded")

    model.net_info["height"] = reso
    inp_dim = int(model.net_info["height"])
    assert inp_dim % 32 == 0
    assert inp_dim > 32

    # If there's a GPU availible, put the model on GPU
    if CUDA:
        model.cuda()

    # Set the model in evaluation mode
    model.eval()

    # Detection phase
    print(torch.cuda.get_device_name(0))
    print('Allocated:', round(torch.cuda.memory_allocated(0) / 1024 ** 3, 1), 'GB')
    print('Cached:   ', round(torch.cuda.memory_cached(0) / 1024 ** 3, 1), 'GB')
    frame = cv2.imread(videofile)

    img = prep_image(frame, inp_dim)
    #        cv2.imshow("a", frame)
    im_dim = frame.shape[1], frame.shape[0]
    im_dim = torch.FloatTensor(im_dim).repeat(1, 2)

    if CUDA:
        im_dim = im_dim.cuda()
        img = img.cuda()

    with torch.no_grad():
        output = model(Variable(img, requires_grad=True), CUDA)
    output = write_results(output, kind, confidence, num_classes, nms_conf=nms_thesh)


    print('Allocated:', round(torch.cuda.memory_allocated(0) / 1024 ** 3, 1), 'GB')
    print('Cached:   ', round(torch.cuda.memory_cached(0) / 1024 ** 3, 1), 'GB')
    if type(output) == int:
        print("없는데?????")
    if type(output) != int:
        im_dim = im_dim.repeat(output.size(0), 1)
        scaling_factor = torch.min(416 / im_dim, 1)[0].view(-1, 1)

        output[:, [1, 3]] -= (inp_dim - scaling_factor * im_dim[:, 0].view(-1, 1)) / 2
        output[:, [2, 4]] -= (inp_dim - scaling_factor * im_dim[:, 1].view(-1, 1)) / 2

        output[:, 1:5] /= scaling_factor

        for i in range(output.shape[0]):
            output[i, [1, 3]] = torch.clamp(output[i, [1, 3]], 0.0, im_dim[i, 0])
            output[i, [2, 4]] = torch.clamp(output[i, [2, 4]], 0.0, im_dim[i, 1])

        # 사람이미지 자르는데 이건 모든프레임 필요x 1/6 마다 추출
        if kind ==0:
            findRes = list(map(lambda x: cutPerson(x, frame), output))
        else:
            list(map(lambda x: cutNotPerson(x, frame), output))
    # 위랑 밑에 주석 바꾸셈. 위 = 색적용X , 밑= 색적용O

    if type(output) != int:
        list(map(lambda x: write(x, frame), output))
    # 입력 종류(dog or person)에 따라 거른 욜로 결과를 프레임에 그림
    #if type(output) != int:
    #    # type == int => 뜻은 욜로 아무것도 못찾았다임
    #    for i, out in enumerate(output):
    #        if findRes[i]:
    #            write(out, frame)
    path = "./yoloresult/exYolo.jpg"
    cv2.imwrite(path, frame)
    cv2.imshow("dd",frame)
    cv2.waitKey(0)
    print("Total Time : ", (time.time() - start))


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

    cv2.rectangle(img, c1, c2, color, 2)  # 객체 네모칸 쳐주는 코드
    t_size = cv2.getTextSize(label, cv2.FONT_ITALIC, 0.3, 1)[0]  # 폰트 바꾸는 코드
    # c2 = c1[0] + t_size[0] + 3, c1[1] + t_size[1] + 4
    # person 만 나오게 사이즈 조절함.
    c2 = c1[0] + t_size[0]*5, c1[1] - t_size[1]*5

    cv2.rectangle(img, c1, c2, color, -1)  # 글자 네모칸 쳐주는 코드
    # cv2.putText(img, label, (c1[0], c1[1] + t_size[1] + 4), cv2.FONT_ITALIC, 1, [225, 255, 255], 1);
    # 이미지, 글자, 시작위치, 폰트, 글자크기, 색bgr, 두께
    cv2.putText(img, label, (c1[0], c1[1]-3), cv2.FONT_ITALIC, 1.5, [225, 255, 255], 3);
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
    path = "./cuttednotperson/test" +str(personNum)+".jpg"
    personNum += 1
    cv2.imwrite(path, img_cut)

# 이미지에서 좌표로 박스 자름
def cutPerson(x, img):
    c1 = tuple(x[1:3].int())
    c2 = tuple(x[3:5].int())
    x, y = c1
    x_max, y_max = c2
    w = x_max - x
    h = y_max - y
    img_cut = img[y:y+h, x:x+w]

    global personNum
    path = "./cuttedperson/person" +str(personNum)+".jpg"
    upperPath = "./cuttedupper/upper" +str(personNum)+".jpg"
    lowerPath = "./cuttedlower/lower" +str(personNum)+".jpg"

    upperFind, cutToUpper = cutUpperBody(img_cut)

    if not bool(upperFind):
        return False
    lowerFind, cutToLower = cutLowerBody(img_cut)

    if not bool(lowerFind):
        return False

    cv2.imwrite(path, img_cut)
    cv2.imwrite(upperPath, cutToUpper)
    cv2.imwrite(lowerPath, cutToLower)
    personNum += 1

    return True

def cutUpperBody(img):
    img_h = img.shape[0]
    img_w = img.shape[1]
    cutToUpper = img[int((img_h/10)*1): int((img_h/10)*6), : img_w]
    global upperHexCode
    find = color(upperHexCode, cutToUpper)
    if not find:
        return int(0), ""
    print("Upper True")
    return int(1) , cutToUpper

def cutLowerBody(img):
    img_h = img.shape[0]
    img_w = img.shape[1]
    cutToLower = img[int((img_h / 10) * 5): img_h, : img_w]

    global lowerHexCode
    find = color(lowerHexCode, cutToLower)
    if not find:
        return int(0), ""
    print("Lower True")
    return int(1), cutToLower


# 영상 중간중간 yolo 결과로 저장 하는 메소드
def stepFrameToVideo(inputs, start, end, step, fps=25, pathDir="./yoloresult"):
    height, width, layers = inputs[0].shape
    size = (width, height)

    pathOut = pathDir + '/yoloed_' + str(step) + '.avi'
    out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)
    count = start
    while count < end:
        out.write(inputs[count])
        count += 1
    out.release()


def frameToWholeVideo(inputs, fps=25, pathDir="./yoloresult"):
    height, width, layers = inputs[0].shape
    size = (width, height)
    pathOut = pathDir + '/yoloVideo.avi'
    out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)
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
        pathOut = pathDir + '/video' + str(i + 1) + '.avi'
        out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)
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