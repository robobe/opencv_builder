// g++ simple_cuda.cpp -o simple_cuda `pkg-config --cflags --libs opencv4` -I/usr/include/opencv4/

#include <opencv2/core.hpp>
#include <opencv2/core/cuda.hpp>
#include <iostream>

int main() {
    int device_count = cv::cuda::getCudaEnabledDeviceCount();
    if (device_count == 0) {
        std::cout << "❌ No CUDA-enabled devices found." << std::endl;
        return 1;
    }

    std::cout << "✅ CUDA-enabled device count: " << device_count << std::endl;

    for (int i = 0; i < device_count; ++i) {
        cv::cuda::DeviceInfo dev_info(i);
        std::cout << "Device " << i << ": " << dev_info.name() << std::endl;
    }

    return 0;
}
