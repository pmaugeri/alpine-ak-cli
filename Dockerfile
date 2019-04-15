FROM alpine:3.9

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN apk update && \
	apk add ca-certificates && \
	update-ca-certificates && \
	apk add wget && \
	pip3 install --upgrade pip && \
	pip3 install --upgrade setuptools && \
	apk add build-base libffi-dev openssl-dev python3-dev nodejs bind-tools curl jq && \
	pip3 install --no-cache-dir edgegrid-python

# Install Akamai CLI 1.1.3, and packages 'property' and 'image-manager'
RUN wget https://github.com/akamai/cli/releases/download/1.1.3/akamai-1.1.3-linux386 && \
	chmod +x akamai-1.1.3-linux386 && \
	mv akamai-1.1.3-linux386 /usr/bin/akamai && \
	ln -s /root/data/.edgerc /root/.edgerc && \
	apk add --no-cache --virtual .build-deps npm && \
	akamai install property && \
	akamai install image-manager && \
	apk del .build-deps

# Customizations
ENV ENV="/etc/profile"
RUN echo "alias ll='ls -la'" >> "$ENV"