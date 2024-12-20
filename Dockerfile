# Sử dụng Ubuntu làm base image
FROM ubuntu:latest

# Bước 2: Cài đặt các gói cần thiết
RUN apt-get update && apt-get install -y \
    sudo \
    python3 \
    python3-pip \
    procps \
    htop \
    speedtest-cli \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# Bước 3: Cấu hình SSH
RUN mkdir /var/run/sshd && echo 'root:root' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Bước 4: Mở cổng SSH
EXPOSE 22

# Bước 5: Chạy SSH khi container khởi động
CMD ["/usr/sbin/sshd", "-D"]
