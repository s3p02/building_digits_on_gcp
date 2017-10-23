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

