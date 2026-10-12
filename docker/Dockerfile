@'
FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04
RUN apt-get update && apt-get install -y python3-pip python3-dev
RUN pip3 install --no-cache-dir torch torchvision --index-url https://pytorch.org
WORKDIR /app
COPY src/ .
CMD ["python3", "benchmark.py"]
'@ | Out-File -FilePath docker/Dockerfile -Encoding utf8