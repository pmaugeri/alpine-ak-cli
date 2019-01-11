FROM frolvlad/alpine-python3
RUN apk update
RUN apk add ca-certificates
RUN update-ca-certificates
RUN apk add wget
RUN pip3 install --upgrade pip
RUN pip3 install --upgrade setuptools
RUN apk add build-base
RUN apk add libffi-dev openssl-dev python3-dev
RUN pip3 install edgegrid-python
RUN apk add nodejs
RUN wget https://github.com/akamai/cli/releases/download/1.0.2/akamai-1.0.2-linux386
RUN chmod +x akamai-1.0.2-linux386
RUN mv akamai-1.0.2-linux386 /usr/bin/akamai
RUN apk add npm
RUN akamai install property
RUN ln -s /root/data/.edgerc /root/.edgerc

# Install Akamai CLI packages
RUN akamai install image-manager

# Install tools
RUN apk add bind-tools
RUN apk add curl

# Customizations
ENV ENV="/etc/profile"
RUN echo "alias ll='ls -la'" >> "$ENV"
