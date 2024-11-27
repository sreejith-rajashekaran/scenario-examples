# Build Docker Image

The following instructions will lead you to build an image from source.

### Step 1: Create a new directory and cd into it

```plain
mkdir app
cd app
```{{exec}}


### Step 2: Create a file named app.py by navigating to "app" folder using the Editor


### Step 3: Copy the below code into the app.py file

```plain
import os
from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
    target = os.environ.get('TARGET', 'World')
    return 'Hello {}!\n'.format(target)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', "8080")))
```


### Step 4: Create a file named Dockerfile and copy the code

```plain
# Use the official Python image.
# https://hub.docker.com/_/python
FROM python:3.7-slim-buster

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
# Install production dependencies.
RUN pip install Flask gunicorn
ENV PORT=8080
COPY . .

# Run the web service on container startup. Here we use the gunicorn webserver
CMD exec gunicorn --bind :$PORT app:app
```


### Step 5: Login to your Docker Hub
```plain
docker login
```{{exec}}


### Step 6: Use Docker to build the sample code into a container. To build and push with Docker Hub, run these commands replacing oamdev with your Docker Hub username

```plain
# Build the container on your local machine
docker build -t oamdev/helloworld-python:v1 .

# Push the container to docker registry
docker push oamdev/helloworld-python:v1
```


### Step 7: Log into your Docker Hub and Now we have a docker image tagged helloworld-python:v1
