import cv2
import numpy as np
from pdf2image import convert_from_path

image = convert_from_path('created_sheet.pdf')
image[0].save('created_sheet.png', 'png')

img = cv2.imread('created_sheet.png')
height, width, channels = img.shape[:3]
s = 1000

for y in range(height):
    if all(img[y, s] != np.array([255, 255, 255])):
        h1 = y + 3
        break

for y in reversed(range(height)):
    if all(img[y, s] != np.array([255, 255, 255])):
        h2 = y
        break

for x in range(width):
    if all(img[s, x] != np.array([255, 255, 255])):
        w1 = x + 3
        break

for x in reversed(range(width)):
    if all(img[s, x] != np.array([255, 255, 255])):
        w2 = x
        break

crop_img = img[h1:h2, w1:w2]
height, width, channels = crop_img.shape[:3]
crop_img = cv2.resize(crop_img, (int(width*0.66), int(height*0.66)))
cv2.imwrite('created_sheet.png', crop_img)
