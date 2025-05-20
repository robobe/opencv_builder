
```bash title="run cuda devel base image"
docker run -it --rm --gpus all nvidia/cuda:12.2.0-devel-ubuntu22.04 /bin/bash
```

### Build

```
docker build -f Dockerfile.cuda -t opencv:builder .
```

```
docker run -it --rm --gpus all \
-v `pwd`:/workspace \
docker.io/library/opencv:builder \
/bin/bash
```


```
cmake \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D OPENCV_DNN_CUDA=ON \
-D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-12.2 \
-D CUDA_ARCH_BIN="5.2 5.3 6.0 6.1 6.2 7.0 7.2 7.5 8.0 8.6" \
-D CUDA_ARCH_PTX="8.6rm -rf" \
-D ENABLE_FAST_MATH=1 \
-D CUDA_FAST_MATH=1 \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.10.0/modules \
-D WITH_GSTREAMER=OFF \
-D WITH_LIBV4L=ON \
-D BUILD_opencv_python3=ON \
-D BUILD_TESTS=OFF \
-D BUILD_PERF_TESTS=OFF \
-D BUILD_EXAMPLES=OFF \
-D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_QT=ON \
-D WITH_GTK=ON \
-D WITH_VTK=OFF \
-D WITH_FFMPEG=OFF \
-D WITH_1394=OFF \
-D CPACK_BINARY_DEB=ON \
-D BUILD_JAVA=OFF ..
```

```
cmake \
-D CMAKE_BUILD_TYPE=Release \
-D OPENCV_VERSION=4.10.0 \
-D WITH_CUDA=ON \
-D WITH_CUDNN=ON \
-D WITH_CUBLAS=1 \
-D OPENCV_DNN_CUDA=ON \
-D CUDA_ARCH_BIN=6.1 \
-D Atlas_CBLAS_INCLUDE_DIR=/usr/lib/x86_64-linux-gnu/ \
-D OpenBLAS_LIB=/usr/lib/x86_64-linux-gnu/ \
-D OPENCV_EXTRA_MODULES_PATH=~/project/opencv_contrib/modules \
-D PYTHON3_EXECUTABLE=~/project/.env/bin/python \
-D PYTHON_LIBRARIES=~/project/.env/lib/python3.10/site-packages \
-D BUILD_opencv_python3=ON \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D BUILD_JAVA=OFF ..
```

- [How to Configure Ubuntu 22.04 for CUDA Programming and OpenCV: A Comprehensive Guide](https://medium.com/@adari.girishkumar/how-to-configure-ubuntu-22-04-for-cuda-programming-and-opencv4-a-comprehensive-guide-e1eb89cbc21f)
- [NVIDIA CUDA Installation Guide for Linux](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/#network-repo-installation-for-ubuntu)
- [Build OPENCV VERSION 4.10.0 on: Ubuntu 22.04, GPU Driver Version: 550.78, CUDA Version: 12.4, GCC-10](https://gist.github.com/madtunebk/5f20437725eb0e0cfc2a4934153b0ab4)