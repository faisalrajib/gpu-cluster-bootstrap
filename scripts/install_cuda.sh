@'
#!/bin/bash
set -e
echo "🚀 Starting Automated AI Infrastructure Provisioning..."
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y build-essential dkms curl freeglut3-dev libxmu-dev libxi-dev
wget https://nvidia.com
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://nvidia.com
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get install -y cuda-toolkit-12-4 cuda-drivers
curl -fsSL https://github.io | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://github.io | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
echo "✅ Provisioning complete! Please reboot using 'sudo reboot'."
'@ | Out-File -FilePath scripts/install_cuda.sh -Encoding utf8
