# Build Opencv with cuda support


### Build

The build base on nvida docker **devel** version with **cuda** and **cudnn** the cuda version select by checking `nvidia-smi`

The process has there steps (declare as vscode tasks):

1. Download and extract the request version
2. Build
3. Pack (the pack prcoess include `make install` and `make package ..`)

!!! note "Permissions"
    The docker run as none root user
    The Pack step need permission then it run with sudo

    `make install` and `make package ..`
     

### Check

Run docker again

```
sudo apt update
from debs folder 
sudo apt install ./*.deb
```

```bash title="python"
>>> import cv2
>>> cv2.__version__
'4.10.0'
>>> cv2.cuda.getCudaEnabledDeviceCount()
1
```

#### Check using cpp

Build simple load and view image 

```bash
g++ simple.cpp -o simple `pkg-config --cflags --libs opencv4` -I/usr/include/opencv4/
```

#### Demo: using cmake

!!! note ""
     The `CMakeLists.txt` file in the same location as the source

```c
cmake_minimum_required(VERSION 3.10)
project(simple_opencv_example)

find_package(OpenCV REQUIRED)

add_executable(simple simple.cpp)
target_include_directories(simple PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(simple PRIVATE ${OpenCV_LIBS})
```



```bash
# from project root
cmake -S src -B build
cmake --build build
```
