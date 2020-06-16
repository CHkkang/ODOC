from __future__ import absolute_import, division, print_function, unicode_literals

# tensorflow와 tf.keras를 임포트합니다
import tensorflow as tf
from tensorflow import keras

# 헬퍼(helper) 라이브러리를 임포트합니다
import numpy as np
import matplotlib.pyplot as plt
import cv2
import os
import functools
import time
import pandas as pd
import shutil

import gc

# StratifiedKFold
from sklearn.model_selection import StratifiedKFold

# root_data_path는 데이터셋 디렉토리
root_data_path = '/content/DeepFashion2/'
label = {
    'top': {'short_top': 0, 'long_top': 1},
    'bottom': {'short_bottom': 0, 'long_bottom': 1, 'skirt': 2}
}

top_classes = {v: k for k, v in label['top'].items()}
bottom_classes = {v: k for k, v in label['bottom'].items()}

top_class_num = len(top_classes.values())
bottom_class_num = len(bottom_classes.values())

# 이미지 사이즈
IMG_SIZE_X = 160
IMG_SIZE_Y = 160

# tf.debugging.set_log_device_placement(True)

# 모델 객체 생성
def create_model(class_num, load_weights_path):
    #with tf.device('/CPU:0'):
    inputs = keras.Input(shape=(IMG_SIZE_X, IMG_SIZE_Y, 3))

    model = keras.applications.InceptionResNetV2(input_tensor=inputs, include_top=False, weights=None, pooling='avg')
    x = model.output
    x = keras.layers.Dense(1000, name='fully')(x)
    x = keras.layers.BatchNormalization()(x)
    x = keras.layers.Activation('relu')(x)
    outputs = keras.layers.Dense(class_num, activation='softmax', name='softmax')(x)

    model = keras.Model(inputs, outputs)
    model.compile(optimizer='adam',
                  loss='sparse_categorical_crossentropy',
                  metrics=['accuracy'])

    model.load_weights(load_weights_path)

    return model


# top_model = create_model(top_class_num, "./videoMake/top/my_checkpoint_top")
# bottom_model = create_model(bottom_class_num, "./videoMake/bottom/my_checkpoint_bottom")

def imgToStr(img, top_model, bottom_model=None):
    str = "person&"

    prediction = top_model.predict(img)
    if prediction == 0:
        str.append("short&")
    else:
        str.append("long&")


    # prediction = bottom_model.predict(img)

    # if prediction == 0:
    #     str.append("short&")
    # else:
    #     str.append("long&")

    str.append("short&")

    return str





# 여기서부터는 모델 예측 코드인데 나중에 원하는대로 수정만하면댐 일단 주석처리함
def m_imread(path):
    img = cv2.imread(path)
    img = cv2.resize(img, dsize=(IMG_SIZE_X, IMG_SIZE_Y), interpolation=cv2.INTER_AREA)
    img = img / 255.0

    return img

# type 인자가 긴팔 반팔인지 구분하는 변수
def predict(img, input_type, model, flag=0):
    img = cv2.resize(img, dsize=(IMG_SIZE_X, IMG_SIZE_Y), interpolation=cv2.INTER_AREA)
    img = np.expand_dims(img, axis=0)

    # flag = 0 : top, 1 : bottom
    if flag == 0:
        # model = top_model
        classes = top_classes
        input_type = input_type + "_top"

    elif flag == 1:
        # model = bottom_model
        classes = bottom_classes
        if not input_type == 'skirt':
            input_type = input_type + "_bottom"
    #with tf.device('/CPU:0'):
    #    prediction = model.predict(img)
    #    predict_type = classes[np.argmax(prediction)]

    prediction = model.predict(img)
    predict_type = classes[np.argmax(prediction)]

    print(predict_type)

    if input_type == predict_type:
        return True
    else:
        return False
# start = time.time()
# predict(m_imread("person1.jpg"), "short", flag=0)
# predict(m_imread("person4.jpg"), "short", flag=1)
# print("predict time : ", time.time() - start )
# img = m_imread("C:/Users/a0102/Downloads/validation/validation/long_bottom/000290.jpg")
# print(predict(img, input_type="long_bottom", flag=1))

# # # img_directory_path = 예측할 이미지가 저장된 디렉토리 경로
# def tpredict(img_directory_path, flag=0):
#     img_list = [file for file in os.listdir(img_directory_path) if file.endswith(".jpg")]
#     imgs = np.zeros(shape=(len(img_list), IMG_SIZE_Y, IMG_SIZE_X, 3))
#     for i in range(len(img_list)):
#         imgs[i] = m_imread(img_directory_path + str(img_list[i]))
#
#     # flag = 0 : top, 1 : bottom
#     if flag == 0:
#         model = top_model
#         classes = top_classes
#
#     elif flag == 1:
#         model = bottom_model
#         classes = bottom_classes
#
#     predictions = model.predict(imgs)
#     for i in range(len(imgs)):
#         if classes[np.argmax(predictions[i])] == 'short_top':
#             print(img_list[i], classes[np.argmax(predictions[i])])
#
#
# tpredict("C:/Users/a0102/PycharmProjects/Capstone/cuttedupper/")