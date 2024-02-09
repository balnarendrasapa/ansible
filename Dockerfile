# Use the official Ubuntu base image
FROM ubuntu:latest

# Define a build argument for the username
ARG USERNAME=username
ARG PASSWORD=password

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Install the OpenSSH server
RUN apt-get update \
    && apt-get install -y openssh-server sudo\
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && apt-get install -y tzdata vim ansible curl

# Create an SSH user and set a password (replace 'user' and 'password' with your desired values)
RUN useradd -m -s /bin/bash ${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd

# Allow the user to run sudo without a password
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Create the missing privilege separation directory
RUN mkdir /run/sshd
RUN mkdir ~/ansible

# Expose SSH port
EXPOSE 22

# Start the SSH server
CMD ["/usr/sbin/sshd", "-D"]