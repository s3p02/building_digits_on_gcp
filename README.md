# building_digits_on_gcp


# Check for Nvidia GPU

```
lspci
```

<kbd>
  <img src="/d_0_check _for_gpu.png">
</kbd>

# Install Nvidia Drivers & CUDA 8

Save the following code using vim or nano, name your file [0_install_nvidia_drivers.sh](https://github.com/s3p02/building_digits_on_gcp/blob/master/0_install_nvidia_drivers.sh)

```
#!/bin/bash
echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda; then
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_8.0.61-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1404_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda -y
  apt-get install linux-headers-$(uname -r) -y
fi
```

Using 'chmod' change the permissions of this '.sh' file.

```
sudo chmod a+x 0_install_nvidia_drivers.sh
```
Run the '0_install_nvidia_drivers.sh' file

```
sudo ./0_install_nvidia_drivers.sh 
```
The Script takes 6-8 minutes, depending on the resources alloted.

You must export the cuda path to your '.bashrc'.

```
echo 'export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\' >> ~/.bashrc
echo '                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
source ~/.bashrc
```
Check if path has been exported.

```
nvcc --version 
```

<kbd>
  <img src="/d_2_check_cuda_path.png">
</kbd>

# Check if NVIDIA Drivers have been installed

```
sudo chmod a+x 0_install_nvidia_drivers.sh
```

<kbd>
  <img src="/d_1_check_if_nvidia_driver_installed.png">
</kbd>

# Install Dependencies

```
sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-pip python-scipy python-tk
```
You can save it as a script as well and run [1_install_dependencies.sh](https://github.com/s3p02/building_digits_on_gcp/blob/master/1_install_dependencies.sh) using 'chmod' change the permissions of this '.sh' file.

```
sudo chmod a+x 0_install_nvidia_drivers.sh
```
Run the '1_install_dependencies.sh' file

```
sudo ./0_install_nvidia_drivers.sh 
```

# Build Protobuf 3

Install a few dependencies.


```
sudo apt-get install autoconf automake libtool curl make g++ git python-dev python-setuptools unzip
```

You can save it as a script as well and run [2_build_protobuf_dep.sh](https://github.com/s3p02/building_digits_on_gcp/blob/master/2_build_protobuf_dep.sh) using 'chmod' change the permissions of this '.sh' file.

```
sudo chmod a+x 2_build_protobuf_dep.sh
```
Run the '2_build_protobuf_dep.sh' file

```
sudo ./2_build_protobuf_dep.sh 
```

# Install Caffe

Install a few dependencies for caffe.

```
sudo apt-get install --no-install-recommends build-essential cmake git gfortran libatlas-base-dev libboost-filesystem-dev libboost-python-dev libboost-system-dev libboost-thread-dev libgflags-dev libgoogle-glog-dev libhdf5-serial-dev libleveldb-dev liblmdb-dev libopencv-dev libsnappy-dev python-all-dev python-dev python-h5py python-matplotlib python-numpy python-opencv python-pil python-pip python-pydot python-scipy python-skimage python-sklearn
```

