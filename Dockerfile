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
    tmux \
    ca-certificates \
    gnupg \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Cài đặt Node.js và npm từ NodeSource
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && apt-get install -y npm

# Sao chép package.json và Procfile vào container
COPY package.json package-lock.json /app/
COPY Procfile /app/

# Cài đặt các phụ thuộc Node.js
WORKDIR /app
RUN npm install

# Cài đặt các npm packages nếu cần
RUN npm install -g colors set-cookie-parser axios gradient-string

# Cài đặt Python packages nếu cần
RUN pip3 install --no-cache-dir python-telegram-bot requests pytz termcolor colorama asyncio

# Khởi động lệnh shell bất kỳ khi container khởi động
CMD bash -c "echo 'Container deployed successfully' && tail -f /dev/null"
