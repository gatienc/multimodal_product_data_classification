import numpy as np
import matplotlib.pyplot as plt
import os
from tqdm.auto import tqdm
arr = os.listdir('images/image_train/')


def get_transparency(image):
    return np.sum(image, axis=2) != 765


def sides_limit(image):
    """

    """
    shape = image.shape

    # Left side
    i = 0
    while i < shape[1] and image[:, i].sum() == 0:
        i += 1
    limit_left = i

    # Right side

    i = shape[1]-1
    while i > 0 and image[:, i].sum() == 0:
        i -= 1
    limit_right = i

    # Top side

    i = 0
    while i < shape[0] and image[i, :].sum() == 0:
        i += 1
    limit_top = i

    # Bottom side

    i = shape[0]-1
    while i > 0 and image[i, :].sum() == 0:
        i -= 1
    limit_bottom = i

    return ([limit_left, limit_right, limit_top, limit_bottom])


error_list = []
for i in tqdm(arr):
    if i.endswith('.jpg'):
        img = plt.imread('images/image_train/' + i)
        limit = sides_limit(get_transparency(img))
        cropped_img = img[limit[2]:limit[3], limit[0]:limit[1], :]
        if cropped_img.shape[0] < 5 or cropped_img.shape[1] < 5:
            if img.shape[0] < 5 or img.shape[1] < 5:
                img = np.zeros((500, 500, 3), dtype=np.uint8)
                img.fill(255)
                plt.imsave('images/cropped_train/' + i, img)
            plt.imsave('images/cropped_train/' + i, img)
        try:
            plt.imsave('images/cropped_train/' + i, cropped_img)
        except:
            print(i)
            error_list.append(i)
# save error list to text file
with open('error_list.txt', 'w') as f:
    for item in error_list:
        f.write("%s\n" % item)
