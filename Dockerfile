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
    curl \
    gnupg \
    lsb-release \
    ca-certificates \
    tmux \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Node.js từ NodeSource (v20)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y npm

# Cài đặt các Python packages
RUN pip3 install --no-cache-dir python-telegram-bot requests pytz termcolor colorama asyncio

# Cài đặt các npm packages
RUN npm install -g colors set-cookie-parser axios gradient-string

# Thêm biến môi trường cho Node.js để tránh cảnh báo
RUN echo 'export NODE_OPTIONS="--no-warnings"' >> ~/.bashrc

# Lệnh để đảm bảo container sẽ chạy liên tục và không thoát ngay
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
