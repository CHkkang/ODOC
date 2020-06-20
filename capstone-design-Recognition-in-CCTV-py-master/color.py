import cv2
import numpy as np

def main():
    color()


def hex_to_hsv(hexCode):
    #h = input('hex값 입력: ').lstrip('#')
    h = hexCode
    bgr = tuple(int(h[i:i+2], 16) for i in (4, 2, 0))
    #print(bgr)
    bgr_split = str(bgr).split(', ')

    # 값 쪼개기
    blue = bgr_split[0]
    blue = blue[1:]
    green = bgr_split[1]
    red = bgr_split[2]
    red = red[:-1]


    hsv = np.uint8([[[blue, green, red]]])
    hsv = cv2.cvtColor(hsv, cv2.COLOR_BGR2HSV)
    #print(hsv)
    return hsv

def color(hexCode, cutImage=""):

    hex = hexCode.lstrip(('#'))
    '''
    hsv = hex_to_hsv(hexCode)# hex값 넣을 곳
    print("h = " + str(hsv[0][0][0]))
    print("s = " + str(hsv[0][0][1]))
    print("v = " + str(hsv[0][0][2]))
    h = int(hsv[0][0][0])
    s = int(hsv[0][0][1])
    v = int(hsv[0][0][2])
    '''

    #img = cv2.imread('color.png')
    #img = cv2.imread('sample.jpg')
    img = cutImage
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    hsv = brightness(hsv)
    #lower = np.array([0, 0, 255]) # 직접 넣을 때 사용 할 코드
    #upper = np.array([0, 0, 255])

    if (hex == str('ff0000')):  # 빨강색YES  (핑크도 읽음)
        lower = np.array([161, 100, 100])
        upper = np.array([179, 255, 255])
    elif (hex == str('ff8400')):  # 주황색 YES (노랑 조금 읽음)
        lower = np.array([0, 180, 186])
        upper = np.array([47, 255, 255])
    elif (hex == str('6e4129')):  # 갈색 YES (피부 읽음)
        lower = np.array([-15, 100, 90])
        upper = np.array([15, 200, 255])
    elif (hex == str('c9b56c')):  # 베이지 YES (피부 읽음)
        lower = np.array([4, 0, 90])  # 10 5 90
        upper = np.array([30, 120, 255])  # 30 120 210
    elif (hex == str('ffe600')):  # 노랑 YES
        lower = np.array([20, 100, 100])  # 4 0 90
        upper = np.array([40, 255, 255])  # 30 255 255
    elif (hex == str('0022ff')):  # 파랑 YES
        lower = np.array([80, 40, 40])
        upper = np.array([126, 255, 255])
    elif (hex == str('252069')): # 남색 YES
        lower = np.array([80, 40, 40])
        upper = np.array([126, 255, 255])
    elif (hex == str('00eeff')): # 하늘 YES
        lower = np.array([80, 40, 40])
        upper = np.array([126, 255, 255])
    elif (hex == str('a805fa')):  # 보라 YES
        lower = np.array([120, 50, 80])
        upper = np.array([173, 215, 255])
    elif (hex == str('f1b0ff')):  # 연보라 YES
        lower = np.array([120, 50, 80])
        upper = np.array([173, 215, 255])
    elif (hex == str('ff69b4')):  # 핑크 YES
        lower = np.array([120, 50, 80])
        upper = np.array([173, 215, 255])
    elif (hex == str('26ff00')):  # 초록 YES
        lower = np.array([45, 25, 60])  # |10 0 60 | 60 100 40
        upper = np.array([80, 255, 255])  # | 92 255 255 | 90 255 255
    elif (hex == str('828282')):  # 회색 YES
        lower = np.array([0, 0, 60])  # 0 0 70
        upper = np.array([180, 43, 220])  # 180 20 255
    elif (hex == str('ffffff')):  # 하얀 YES
        lower = np.array([0, 0, 170])  # 0 0 70
        upper = np.array([180, 40, 255])  # (179)180 20 255
    elif (hex == str('000000')):  # 검정 YES
        lower = np.array([0, 0, 0])  # 0 0 0
        upper = np.array([179, 30, 100])  # 179 255 50
    elif (hex == str('2a5c35')):  # 카키 YES
        lower = np.array([10, 70, 80])  #
        upper = np.array([40, 160, 190])  #
    else:
        print("input color error")
        lower = np.array([0, 0, 0])
        upper = np.array([180, 255, 255])

    mask = cv2.inRange(hsv, lower, upper)
    p = percent(mask)
    #print("percent  :  " , p)
    if p >= 1.8:
        return True
    else:
        return False

'''
    new_img = cv2.bitwise_and(img, img, mask=mask)

    cv2.imshow('mask', mask) # 색칠 된 자리 가 어딘지 알려주는 곳
    cv2.imshow("color", new_img) # 색칠까지 보여주는 곳
    cv2.imshow('image', img)

    #np.set_printoptions(threshold=sys.maxsize)
    #print(mask)

    cv2.waitKey(0)
    cv2.destroyAllWindows()
    #print("percent " +str(p))
'''

def brightness(img):  # 지금 0.4 - 60 완벽 0.3 - 50 까지 완벽.
    image = img


    ## 밝게하기(원본보다 100만큼 밝게(최대 255))
    control = np.ones(image.shape, dtype="uint8") * 20
    brightnessImage = cv2.add(image, control)
    img = brightnessImage
    return img


def percent(mask):
    img_h = mask.shape[0]
    img_w = mask.shape[1]

    detectMask = mask[int((img_h / 6) * 1): int((img_h / 6) * 4), int((img_w / 6) * 1): int((img_w / 6) * 5)]
    detectRes = np.count_nonzero(detectMask == 255)
    #print("res : " , detectRes)
    total = detectMask.shape[0] * detectMask.shape[1]
    #print("total : ", total)
    #cv2.imshow("mask", detectMask)
    #cv2.imshow("res", detectRes)
    #cv2.imshow("total", total)
    #cv2.waitKey(0)
    return int( (detectRes / total) * 100)
#main()