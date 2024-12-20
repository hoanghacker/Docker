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

# Mở cổng TCP 8000
EXPOSE 8000

# Thêm health check kiểm tra kết nối TCP tới cổng 8000
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD nc -z localhost 8000 || exit 1

# Chạy một lệnh shell bất kỳ khi container khởi động
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
