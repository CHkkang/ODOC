import cv2
import matplotlib.pylab as plt
import numpy as np
import time
import os

def videoSlice(cut, videoFile):
    start = time.time()  # 시작 시간 저장
    pathDir = './sliceresult'
    if os.path.exists(pathDir):
        for file in os.scandir(pathDir):
            os.remove(file.path)

    cap = cv2.VideoCapture(videoFile)
    count=1
    frames = []
    while(cap.isOpened()):
        ret, frame = cap.read()
        #cv2.imshow("frame ", frame)
        if ret==True:
            frames.append(frame)
            #cv2.imwrite("./airport/image" + str(count) + ".jpg", frame)
            count = count +1
            ### ----
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break
        else:
            break
    cap.release()

    print('The number of frames saved: ', len(frames))
    print("time :", time.time() - start)  # 현재시각 - 시작시간 = 실행 시간

    '''
    fig, axes = plt.subplots(3, 3, figsize=(15, 10))
    axes = np.array(axes)
    axes = axes.reshape(-1)
    
    ax_ix =0
    for i in [0, 50, 100, 150, 200, 250, 300, 350, 400]:
        frame = frames[i]
        #fig, ax = plt.subplots(1,1, figsize=(5, 5))
        image = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        axes[ax_ix].imshow(image)
        axes[ax_ix].xaxis.set_visible(False)
        axes[ax_ix].yaxis.set_visible(False)
        axes[ax_ix].set_title(f'Frame {i}')
        ax_ix += 1
    
    plt.grid(False)
    plt.show()
    
    '''

    fps = 25.0
    height, width, layers = frames[0].shape
    size = (width,height)

    #cut = 3   # 몇개로 쪼갤지

    l = int(float(len(frames) / cut))
    sss = int(float(len(frames) / cut))
    count=0

    for i in range(cut):
        pathOut = pathDir + '/video'+ str(i+1) + '.avi'
        out = cv2.VideoWriter(pathOut, cv2.VideoWriter_fourcc(*'DIVX'), fps, size)
        while True:
            if count== l:
                break
            if count>= len(frames):
                break
            # writing to a image array
            out.write(frames[count])
            count+=1
        l += sss
        print(count, l, sss)
        print("time :", time.time() - start)  # 현재시각 - 시작시간 = 실행 시간
    print("Last time :", time.time() - start)  # 현재시각 - 시작시간 = 실행 시간
    out.release()

