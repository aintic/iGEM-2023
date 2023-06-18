
import cv2
import numpy as np
import matplotlib.pyplot as plt

# open default camera for video capturing
# vid = cv2.VideoCapture(0)


# while(True):
#     # return the video frame
#     _, frame = vid.read()
#     gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
#     cv2.imshow('display', gray)

#     width, len = gray.shape
#     avg_intensity = np.sum(gray)/(width*len)
    
#     intensity.append(avg_intensity)
#     if cv2.waitKey(1)==27:
#         break
# vid.release()

image = cv2.imread('spectrum.png', 1)
intensity = []
# before the reaction
# 1. run 1 pass of the program, get the 100% intensity of every column of pixels (baseline)
# 2. store the result somewhere

# after the reaction
# 1. we get 2 inputs: the 100% intensity values, the range of wavelengths we're looking at provided by the user
# 2. read the image in color mode
# 3. get the most intense pixel from each column
# 4. compare with the baseline to get the intensity percentage
# 5. output the graph of intensity percentage in the range of wavelength given


gray_image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)


cv2.destroyAllWindows()
plt.plot(intensity)
plt.show()
