# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    procps \
    htop \
    speedtest-cli \
    curl \
    tmux \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Node.js và npm từ NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt-get install -y nodejs \
    && apt-get install -y npm

# Cài đặt Python packages
RUN pip3 install --no-cache-dir python-telegram-bot requests pytz termcolor colorama asyncio

# Cài đặt các npm packages
RUN npm install -g colors set-cookie-parser axios gradient-string

# Thêm biến môi trường cho Node.js để tránh cảnh báo
RUN echo 'export NODE_OPTIONS="--no-warnings"' >> ~/.bashrc

# Khởi động lệnh shell bất kỳ khi container khởi động
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
