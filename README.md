# Build Opencv with cuda support

### Dirty

!!! warning "dirty"
    because i put the opencv under git control folder all git command working and the cmake take the VSC version
    and we get some hash with dirty as opencv version
    To solve it i create new TAG
     
    ![alt text](images/cofigure_before_tag.png)

    ```bash
    git describe --tags --dirty --always
    #
    4.10.0-2-gd1752e8-dirty
    ```

    ```bash
    To override the "dirty" state in the version string, create a new tag after ensuring your working directory is clean (no uncommitted changes):

    ```bash
    #comit all and retag

    git tag v4.10.0

   
    ```
    ![alt text](images/configure_after_tag.png)
---


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

---

## Check with other docker version

```bash
docker run \
-it --rm \
--hostname=run \
--net=host \
-v ./debs:/debs \
--gpus all \
nvidia/cuda:12.6.0-cudnn-runtime-ubuntu22.04 \
/bin/bash
```

```bash
apt update
cd debs
apt install python3-numpy
apt install ./*.deb
```

```bash
>>> import cv2
>>> cv2.__version__
'4.10.0'
>>> cv2.cuda.getCudaEnabledDeviceCount()
1
```