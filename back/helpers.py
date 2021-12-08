import cv2
import pytesseract
import numpy as np
import pickle


personalities = {
    1: "ENFJ",
    2: "ENFP",
    3: "ENTJ",
    4: "ESFJ",
    5: "INFJ",
    6: "INFP",
    7: "INTP",
    8: "ISFJ",
    9: "ISFP",
    10: "ISTJ",
    11: "ISTP"
}


def display_img(title, img):
    cv2.imshow(title, img)
    cv2.waitKey(0)


# Detecting characters
def detect_characters(img):
    character_cnt = 0
    # Pytesseract дээр RGB-г дэмждэг бол OpenCV дээр BGR байдаг.
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    h_img, w_img, _ = img.shape
    cong = r'--oem 3 --psm 6'
    boxes = pytesseract.image_to_boxes(img, config=cong)
    # print(pytesseract.image_to_string(img))
    for cnt, b in enumerate(boxes.splitlines()):
        if cnt != 0:
            b = b.split()
            print(b)
            x, y, w, h = int(b[1]), int(b[2]), int(b[3]), int(b[4])
            cv2.rectangle(img, (x, h_img - y), (w, h_img - h), (255, 0, 0, 1), 1)
            cv2.putText(img, b[0], (x, h_img - y + 30), cv2.FONT_HERSHEY_COMPLEX, 1, (255, 50, 50), 1)
            character_cnt = cnt

    display_img("Detected characters", img)
    return character_cnt


def detect_words(img):
    word_cnt = 0
    # Pytesseract дээр RGB-г дэмждэг бол OpenCV дээр BGR байдаг.
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    h_img, w_img, _ = img.shape
    cong = r'--oem 3 --psm 6'
    boxes = pytesseract.image_to_data(img, config=cong)
    for cnt, b in enumerate(boxes.splitlines()):
        if cnt != 0:
            b = b.split()
            print(b)
            x, y, w, h = int(b[6]), int(b[7]), int(b[8]), int(b[9])
            # cv2.rectangle(img, (x, y), (w + x, h + y), (255, 0, 0, 1), 3)
            word_cnt = cnt

    display_img("Detected words", img)
    return word_cnt


def gaussian(grayimg):
    # kernel_size = 5
    # kernel = np.ones((kernel_size, kernel_size), np.uint8)
    # gauss = cv2.getGaussianKernel(kernel_size, 0)
    blur = cv2.GaussianBlur(grayimg, (5, 5), 0)
    return blur


def high_boost_filtering(grayimg):
    # Blurring an image with Gaussian filter
    unsharpened_img = gaussian(grayimg)
    # Unsharp mask
    unsharp_mask = grayimg - unsharpened_img
    # Highboost filtering
    k = 5
    sharpened_img = grayimg + k * unsharp_mask
    return sharpened_img


def preprocess_image(img):
    # processed_img = high_boost_filtering(grayimg)
    grayimg = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    (threshold, img_bw) = cv2.threshold(grayimg, 100, 255, cv2.THRESH_BINARY)
    # (threshold, img_bw) = cv2.threshold(grayimg, 10, 255, cv2.THRESH_BINARY | cv2.THRESH_OTSU)
    median = cv2.medianBlur(img_bw, 5)
    # res = np.hstack((median, img_bw))
    # display_img("Preprocessing", res)
    res = median
    return res


def preProcessing(img):
    img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    # Equalizing
    img = cv2.equalizeHist(img)
    img = img / 255
    return img


def is_handwritten(img):
    result = False
    pytesseract.pytesseract.tesseract_cmd = 'tesseract'
    img = preprocess_image(img)

    # Detecting words
    cnt = detect_words(img)
    if cnt > 5:
        result = True

    return result


def predict_personality(inputImg):
    threshold = 0.08
    pickle_in = open("sample/model_trained.p", "rb")
    model = pickle.load(pickle_in)

    # success, imgOriginal = handwriting
    imgOriginal = inputImg
    img = np.asarray(inputImg)
    img = cv2.resize(img, (32, 32))
    img = preProcessing(img)
    cv2.imshow("Processed image", img)
    img = img.reshape(1, 32, 32)
    # Predict
    predict_x = model.predict(img)
    classes_x = np.argmax(predict_x, axis=1)
    classIndex = int(classes_x)
    # print(classIndex)
    predictions = model.predict(img)
    # print(predictions)
    # Element with highest number
    probabilityValue = np.amax(predictions)
    print(classIndex, probabilityValue)

    if probabilityValue > threshold:
        for key in personalities:
            if key == classIndex:
                return personalities[key]