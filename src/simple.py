import cv2

# Load an image from file
image = cv2.imread("/workspaces/opencv_builder/src/lena.png")

# Check if the image was loaded successfully
if image is None:
    print("Failed to load image")
else:
    # Display the image in a window
    cv2.imshow("My Image", image)

    # Wait for any key press
    cv2.waitKey(0)

    # Close all OpenCV windows
    cv2.destroyAllWindows()
