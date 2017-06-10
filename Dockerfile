# Pull base image.
FROM ubuntu

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv iputils-ping && \
  rm -rf /var/lib/apt/lists/*

RUN \
    apt-get update && \
    apt-get install -y wget

# Copy the app and activate directory
COPY . /opt/webapp
WORKDIR /opt/webapp

# Create virtualenv,activate it and install requirements
RUN virtualenv ENV

CMD ["bash","source","./ENV/bin/activate"]

RUN pip install -r requirements.txt

EXPOSE 8080

# Run web app
CMD ["python","./src/simple_web_app.py"]