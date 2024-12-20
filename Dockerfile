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

# Cài đặt Node.js và npm từ NodeSource (cập nhật lên phiên bản mới nhất)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y npm

# Cập nhật npm lên phiên bản mới nhất (nếu chưa cài đặt hoặc đã cài)
RUN npm install -g npm@latest

# Cài đặt các Python packages
RUN pip3 install --no-cache-dir --upgrade python-telegram-bot requests pytz termcolor colorama asyncio

# Cài đặt các gói npm
RUN npm install -g colors set-cookie-parser axios gradient-string

# Thêm biến môi trường cho Node.js để tránh cảnh báo
RUN echo 'export NODE_OPTIONS="--no-warnings"' >> ~/.bashrc

# Đặt thư mục làm việc cho ứng dụng của bạn
WORKDIR /app

# Xóa bộ nhớ cache của npm để tránh lỗi "idealTree"
RUN npm cache clean --force

# Khởi động lệnh shell bất kỳ khi container khởi động
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
