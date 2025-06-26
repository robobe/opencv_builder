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
     