# Use the official Ubuntu base image
FROM ubuntu:latest

# Install the OpenSSH server
RUN apt-get update \
    && apt-get install -y openssh-server sudo\
    && rm -rf /var/lib/apt/lists/*

# Create an SSH user and set a password (replace 'user' and 'password' with your desired values)
RUN useradd -m -s /bin/bash user \
    && echo 'user:password' | chpasswd

# Allow the user to run sudo without a password
RUN echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Create the missing privilege separation directory
RUN mkdir /run/sshd

# Expose SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]