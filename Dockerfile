# Pull base image.
FROM ubuntu

# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Switch to working directory and copy the source files from the host to this directory
WORKDIR /opt/webapp
COPY . .

# Install all python requirements
RUN pip install -r requirements.txt

# Open the port of the web application
EXPOSE 8080

# Run the web application
CMD ["python","./src/simple_web_app.py"]