import numpy as np
import matplotlib.pyplot as plt
import os


def get_transparency(image):
    return image[:, :, 3]


def sides_limit(image):
    """

    """
    shape = image.shape

    # Left side
    i = 0
    while image[:, i].sum() == 0:
        i += 1
    limit_left = i

    # Right side

    i = shape[1]-1
    while image[:, i].sum() == 0:
        i -= 1
    limit_right = i

    # Top side

    i = 0
    while image[i, :].sum() == 0:
        i += 1
    limit_top = i

    # Bottom side

    i = shape[0]-1
    while image[i, :].sum() == 0:
        i -= 1
    limit_bottom = i

    print([limit_left, limit_right, limit_top, limit_bottom])


def crop_image(image, limit):
    return image[limit[2]:limit[3], limit[0]:limit[1], :]

if __name__==
