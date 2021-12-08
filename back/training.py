__author__ = "Ariun-Erdene Tumurchuluun"
__copyright__ = "Copyright 2021, The HWR project"
__version__ = "1.0.0"
__maintainer__ = "Ariun-Erdene Tumurchuluun"
__email__ = "18b1num0515@stud.num.edu.mn"
__status__ = "Production"

import numpy as np
import cv2 as cv
import os

from keras.layers import Conv2D, MaxPooling2D, Dropout, Flatten, Dense
from keras.optimizer_v2.adam import Adam
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import helpers
from keras.preprocessing.image import ImageDataGenerator
from keras.utils.np_utils import to_categorical
from keras.models import Sequential
import pickle

##########################################
path = 'data/'
# 20% - testing, 80% - training
testRatio = 0.2
validationRatio = 0.2
imageDims = (32, 32, 3)
batchSizeValue = 5
epochsValue = 1
stepsPerEpoch = 10
##########################################

images = []
classNo = []
myList = os.listdir(path)
numberOfClasses = len(myList)
print("Total number of class detected is " + str(numberOfClasses))
print("Importing these classes ...")

for x in range(1, numberOfClasses):
    myPickList = os.listdir(path + str(x))

    for y in myPickList:
        currentImg = cv.imread(path + str(x) + "/" + y)
        if currentImg is not None:
            currentImg = cv.resize(currentImg, (imageDims[0], imageDims[1]))
            images.append(currentImg)
            classNo.append(x)
    print(x, end=" ")
print(" ")
print("Total images in image list: " + str(len(images)))
print("Total IDS in classNo list: " + str(len(classNo)))

images = np.array(images)
classNo = np.array(classNo)
print(images.shape)

########### Splitting the data ############
# x_train - Contains image
# y_train - Contains image id
x_train, x_test, y_train, y_test = train_test_split(images, classNo, test_size=testRatio)
x_train, x_validation, y_train, y_validation = train_test_split(x_train, y_train, test_size=validationRatio)
# To test accordingly
print("Training set: " + str(x_train.shape))
print("Testing set: " + str(x_test.shape))
print("Validation set: " + str(x_validation.shape))

numberOfSamples = []
for x in range(1, numberOfClasses):
    numberOfSamples.append(len(np.where(y_train == x)[0]))
print("Number of samples: " + str(numberOfSamples))

plt.figure(figsize=(10, 5))
plt.bar(range(0, numberOfClasses - 1), numberOfSamples)
plt.title("Number of images for each class")
plt.xlabel("Class id")
plt.ylabel("Number of images")
plt.show()
##########################################


# img = helpers.preProcessing(x_train[10])
# img = cv.resize(img, (300, 300))
# cv.imshow("Preprocessed", img)
# cv.waitKey(0)

# Run function over array list elements
x_train = np.array(list(map(helpers.preProcessing, x_train)))
x_test = np.array(list(map(helpers.preProcessing, x_test)))
x_validation = np.array(list(map(helpers.preProcessing, x_validation)))

x_train = x_train.reshape(x_train.shape[0], x_train.shape[1], x_train.shape[2], 1)
x_test = x_test.reshape(x_test.shape[0], x_test.shape[1], x_test.shape[2], 1)
x_validation = x_validation.reshape(x_validation.shape[0], x_validation.shape[1], x_validation.shape[2], 1)

# Augmentation
dataGenerator = ImageDataGenerator(width_shift_range=0.1,
                                   height_shift_range=0.1,
                                   zoom_range=0.2,
                                   shear_range=0.1,
                                   rotation_range=30)
dataGenerator.fit(x_train)
y_train = to_categorical(y_train, numberOfClasses)
y_test = to_categorical(y_test, numberOfClasses)
y_validation = to_categorical(y_validation, numberOfClasses)


def myModel():
    noOfFilters = 60
    sizeOfFilter1 = (5, 5)
    sizeOfFilter2 = (3, 3)
    sizeOfPool = (2, 2)
    noOfNode = 5

    model = Sequential()
    model.add((Conv2D(noOfFilters, sizeOfFilter1, input_shape=(imageDims[0], imageDims[1], 1), activation='relu')))
    model.add((Conv2D(noOfFilters, sizeOfFilter1, activation='relu')))
    model.add(MaxPooling2D(pool_size=sizeOfPool))
    model.add((Conv2D(noOfFilters // 2, sizeOfFilter2, activation='relu')))
    model.add((Conv2D(noOfFilters // 2, sizeOfFilter2, activation='relu')))
    model.add(MaxPooling2D(pool_size=sizeOfPool))
    model.add(Dropout(0.5))
    model.add(Flatten())
    model.add(Dense(noOfNode, activation='relu'))
    model.add(Dropout(0.5))
    model.add(Dense(numberOfClasses, activation='softmax'))
    model.compile(Adam(lr=0.001), loss='categorical_crossentropy', metrics=['accuracy'])
    return model


model = myModel()
print(model.summary())
history = model.fit(dataGenerator.flow(x_train, y_train,
                    batch_size=batchSizeValue),
                    steps_per_epoch=len(x_train) // batchSizeValue,
                    epochs=epochsValue,
                    validation_data=(x_validation, y_validation),
                    shuffle=1)

plt.figure(1)
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.legend(['training', 'validation'])
plt.title('Loss')
plt.xlabel('epoch')
plt.figure(2)
plt.plot(history.history['accuracy'])
plt.plot(history.history['val_accuracy'])
plt.legend(['training', 'validation'])
plt.title('Accuracy')
plt.xlabel('epoch')
plt.show()
score = model.evaluate(x_test, y_test, verbose=0)
print('Test score =', score[0])
print('Test accuracy =', score[1])

pickle_out = open("model_trained.p", "wb")
pickle.dump(model, pickle_out)
pickle_out.close()
