FROM python:3.4

# Install all debian packages
RUN apt-get update && apt-get install -y \
        git \
		gcc \
		curl \
		python3-pip \
        python3-dev \
        python3-setuptools \
		build-essential nodejs\
		libffi-dev libssl-dev libpq-dev jq \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN curl https://get.docker.com | sh

RUN mkdir -p /app-requirements
RUN mkdir -p /app

RUN
COPY requirements /app-requirements/
# Install any needed packages specified in requirements
RUN pip install -r /app-requirements/requirements

WORKDIR /app


