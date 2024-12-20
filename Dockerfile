# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    procps \
    htop \
    speedtest-cli \
    && rm -rf /var/lib/apt/lists/*

# Chạy một lệnh shell bất kỳ khi container khởi động
CMD ["bash", "-c", "echo 'Container deployed successfully' && exec bash"]
