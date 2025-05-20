// g++ simple.cpp -o simple `pkg-config --cflags --libs opencv4` -I/usr/include/opencv4/

#include <opencv2/opencv.hpp>
#include <iostream>

int main()
{
    // Load the image
    cv::Mat image = cv::imread("/workspaces/opencv_builder/src/lena.png");

    // Check if image loaded successfully
    if (image.empty()) {
        std::cerr << "Failed to load image" << std::endl;
        return 1;
    }

    // Show the image in a window
    cv::imshow("My Image", image);

    // Wait for a key press
    cv::waitKey(0);

    // Close all windows
    cv::destroyAllWindows();

    return 0;
}
