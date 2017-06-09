#
# Python Dockerfile
#
#

# Pull base image.
FROM ubuntu

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

RUN \
    apt-get update && \
    apt-get install -y wget

## Install geckodriver
#RUN \
#    wget https://github.com/mozilla/geckodriver/releases/download/v0.16.1/geckodriver-v0.16.1-linux64.tar.gz && \
#    mkdir /opt/geckodriver && \
#    tar -xvzf geckodriver* -C /opt/geckodriver && \
#    chmod +x /opt/geckodriver/* && \
#    export PATH=$PATH:~/geckodriver && \
#    rm -rf geckodriver-v0.16.0-linux64.tar.gz

#ENV PATH="$PATH:/opt/geckodriver"

COPY . /opt/webapp
WORKDIR /opt/webapp
# Copy the app and activate directory

# Create virtualenv,activate it and install requirements
RUN virtualenv ENV
#RUN source ./ENV/bin/activate
CMD ["bash","source","./ENV/bin/activate"]
RUN pip install -r requirements.txt

EXPOSE 8080

# Run web app
CMD ["python","simple_web_app.py"]