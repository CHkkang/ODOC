from videoMake import *
import socket
import time
import threading
import ex,ex3
import torch
import sys
import cv2

complete = [0]
lock = threading.Lock()
label = {
    'top': {'shortTopC': 0, 'longTopC': 1},
    'bottom': {'shortBottomC': 0, 'longBottomC': 1, 'skirtBottomC': 2}
}

top_classes = {v: k for k, v in label['top'].items()}
bottom_classes = {v: k for k, v in label['bottom'].items()}

top_class_num = len(top_classes.values())
bottom_class_num = len(bottom_classes.values())
models = []

# input 동영상(보류) /// 종류 (ex : 사람) , 상의 , 하의 , 상의색, 하의색
def noServer():
    # 맨밑에서 main 대신 noServer 부르면 됨
    # 좀 된 버전 V3
    cfgfile = "videoMake/cfg/yolov3.cfg"
    weightsfile = "videoMake/cfg/yolov3.weights"
    # 가장 최신 V3
    #cfgfile = "videoMake/cfg/yolov3new.cfg"
    #weightsfile = "videoMake/cfg/yolov3new.weights"
    # EfficientNet Yolo
    #cfgfile = "videoMake/cfg/enetb0-coco_final.cfg"
    #weightsfile = "videoMake/cfg/enetb0-coco_final.weights"
    # tiny 욜로
    #cfgfile = "videoMake/cfg/yolov3-tiny.cfg"
    #weightsfile = "videoMake/cfg/yolov3-tiny.weights"
    # openimages
    #cfgfile = "videoMake/cfg/yolov3-openimages.cfg"
    #weightsfile = "videoMake/cfg/yolov3-openimages.weights"
    model = darknet.Darknet(cfgfile)
    model.load_weights(weightsfile)

    start = time.time()
    # 상하의 모델
    #top_model = clothClassification.create_model(top_class_num, "/videoMake/top/my_checkpoint_top")
    #bottom_model = clothClassification.create_model(bottom_class_num, "/videoMake/bottom/my_checkpoint_bottom")
    print("top bottom load time : ", time.time()-start)
    models.append(model)
    modelInit(models[0])
    #models.append(top_model)
    #models.append(bottom_model)

    exStr = "person&long&long&#000000&#000000&dance"
    #exStr = "backpack&./inputvideo/backpack.mp4"
    VideoMake.videoMakeWithYolo(exStr, models)

    # 사진 테스트용 그냥 주석풀고 실행
    # exStr = "handbag&long&long&000000&000000&./dgggg.png"
    #exStr = "person&long&long&#000000&#000000&./1.jpg"
    #ex.exVideoMake(exStr, models)

def modelInit(model):
    reso = 416
    CUDA = torch.cuda.is_available()

    # Set up the neural network
    print("Loading network.....")
    # model = Darknet(cfgfile)
    # model.load_weights(weightsfile)
    print("Network successfully loaded")

    model.net_info["height"] = reso

    # If there's a GPU availible, put the model on GPU
    if CUDA:
        print("CUDA STATUS : " + str(CUDA))
        print(torch.cuda.get_device_name(0))
        model.cuda()

    # Set the model in evaluation mode
    model.eval()


def main():

    # 모델 로드 해놓고 실행하는데 이거 좀 다듬어야할듯
    # 가장 최신 V3
    cfgfile = "videoMake/cfg/yolov3.cfg"
    weightsfile = "videoMake/cfg/yolov3.weights"
    model = darknet.Darknet(cfgfile)
    model.load_weights(weightsfile)
    models.append(model)
    modelInit(models[0])

    ## 재원
    ## 탑 모델
    # top_model = ex3.create_model(top_class_num, "./videoMake/top/my_checkpoint_top")
    # bottom_model = ex3.create_model(bottom_class_num, "./videoMake/bottom/my_checkpoint_bottom")

    # models.append(top_model)
    # models.append(bottom_model)

    PYPORT = 5801
    PYIP = ""
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((PYIP, PYPORT))

    server_socket.listen(5)
    print("TCPServer Waiting for client on port " + str(PYPORT))
    global complete, lock
    while True:
        # 클라이언트 요청 대기중 .
        client_socket, address = server_socket.accept()
        # 클라이언트 호스트네임
        # 연결 요청 성공

        data = client_socket.recv(1024)

        recStartStr = data.decode()
        print(recStartStr)
        if recStartStr == "start":   # 첫번째 보내는 것
            data = "Pready"
            client_socket.sendall(data.encode())

            data = client_socket.recv(1024)
            strData = data.decode()

            thread = threading.Thread(target=VideoMake.videoMakeWithYolo,
                                      args=(strData, models, complete, lock))
            thread.start()

        elif recStartStr == "imgstart":
            data = "imgready"
            client_socket.sendall(data.encode())

            data = client_socket.recv(1024)
            fileData = data.decode()

            data = "start"
            client_socket.sendall(data.encode())



            with open("./inputvideo/inputimg.jpg", 'wb') as yoloed_file:
                filePack = client_socket.recv(1024)
                print('receving....')
                while filePack:
                    #client_socket.sendall(filePack)
                    yoloed_file.write(filePack)
                    filePack = client_socket.recv(1024)
            print("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")

            ## 재원
            #img = cv2.imread("./inputvideo/inputimg.jpg")
            imgstr = "person&short&long&#0022ff&aa&"
            imgstr += fileData

            ## bottom_model 도 줘야하는데 임시로 안줌
            #####str = ex3.imgToStr(img, top_model)
            ## 위에꺼 수행하면 str = "person&상종류&하종류&"
            ## color 꺼내는 method() 만들어서 str에 이어쓰면 돼 &상색&하색
            # str = method(str)

            ## 그리고 마지막에 비디오 이름을 안넣었네 ? 자바랑 통신하는부분 하나 만들어서 비디오 이름 건네 받아야 함.
            ## 자바에서 mp4 이름 받아서 str.append(받은비디오이름) 해주셈

            thread = threading.Thread(target=VideoMake.videoMakeWithYolo, args=(imgstr, models, complete, lock))
            thread.start()


        else :
            print(data.decode())

            #data = client_socket.recv(1024)
            mappingName = data.decode()
            mappingType = mappingName.split(".")[1]
            while True:
                print("밀린 욜로 파일 : ", complete[0])

                if complete[0] >= 1:
                    lock.acquire()
                    try:
                        #if mappingType == "mp4":
                        complete[0] = complete[0] - 1
                        print("보내고 남은 양 : ", complete[0])
                    finally:
                        lock.release()
                    #파일 읽고 보내고
                    with open("./yoloresult/" + mappingName, 'rb') as yoloed_file:
                        filePack = yoloed_file.read(1024)
                        print('sending....')
                        while filePack:
                            client_socket.sendall(filePack)
                            filePack = yoloed_file.read(1024)

                    time.sleep(3)
                    data = "end"
                    client_socket.sendall(data.encode())
                    break
                else:
                    time.sleep(1)



if __name__ == '__main__':
    # noServer()
    main()