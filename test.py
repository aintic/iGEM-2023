import cv2
import numpy as np
import matplotlib.pyplot as plt

# before the reaction
# 1. get a baseline picture of the wavelength before the reaction

# after the reaction
# 1. get the picture of the wavelength after the reaction
# 2. read before and after pictures as grayscale
# 3. get the most intense pixel of every pixel column of the images
# 4. compare the captured intensity with the baseline as a percentage
# 5. output the plot of intensity percentage
# 6. we intepret the corresponding part of the plot based on the wavelength range given by the user

intensity = []

baseline_image = cv2.imread('baseline.jpg', 0)
baseline_intensity = np.amax(baseline_image, axis=0)

actual_image = cv2.imread('actual.jpg', 0)
captured_intensity = np.amax(actual_image, axis=0)

for i in range(len(baseline_intensity)):
  intensity.append(captured_intensity[i]/baseline_intensity[i])

plt.plot(intensity)
plt.show()