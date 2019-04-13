FROM alpine:3.9

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

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

# Install Akamai CLI 1.1.3
RUN wget https://github.com/akamai/cli/releases/download/1.1.3/akamai-1.1.3-linux386
#RUN wget https://github.com/akamai/cli/releases/download/1.1.2/akamai-1.1.2-linux386
RUN chmod +x akamai-1.1.3-linux386
#RUN chmod +x akamai-1.1.2-linux386
RUN mv akamai-1.1.3-linux386 /usr/bin/akamai
#RUN mv akamai-1.1.2-linux386 /usr/bin/akamai
RUN ln -s /root/data/.edgerc /root/.edgerc

# Install Akamai CLI packages
RUN apk add npm
RUN akamai install property
RUN akamai install image-manager

# Install additional optional tools
RUN apk add bind-tools
RUN apk add curl
RUN apk add jq

## Customizations
ENV ENV="/etc/profile"
RUN echo "alias ll='ls -la'" >> "$ENV"
