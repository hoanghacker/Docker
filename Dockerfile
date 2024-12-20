# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    tmux \
    ca-certificates \
    gnupg \
    lsb-release \
    procps \
    htop \
    speedtest-cli \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Node.js và npm từ kho phần mềm chính thức của Ubuntu
RUN apt-get update && apt-get install -y \
    nodejs \
    npm

# Cài đặt Python packages
RUN pip3 install --no-cache-dir python-telegram-bot requests pytz termcolor colorama asyncio

# Cài đặt các npm packages
RUN npm install -g colors set-cookie-parser axios gradient-string

# Thêm biến môi trường cho Node.js để tránh cảnh báo
RUN echo 'export NODE_OPTIONS="--no-warnings"' >> ~/.bashrc

# Khởi động lệnh shell bất kỳ khi container khởi động
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
