import cv2

cap = cv2.VideoCapture(-1)

if not cap.isOpened():
    print('fail')