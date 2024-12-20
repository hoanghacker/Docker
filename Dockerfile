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

# Không cần cài đặt và cấu hình SSH nữa

# Mở các cổng cần thiết cho dịch vụ khác nếu cần
# EXPOSE 8080

# Khởi động dịch vụ khi container khởi động, ví dụ một ứng dụng Python đơn giản
# CMD ["python3", "app.py"]
