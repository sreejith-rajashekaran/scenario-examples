If we want to upgrade an application, the easiest way is to modify the application components' properties.

### Step 1: Change the code
For example, we change the code from Hello to Goodbye in the app.py file. 

```plain
import os

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    target = os.environ.get('TARGET', 'World')
-   return 'Hello {}!\n'.format(target)
+   return 'Goodbye {}!\n'.format(target)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', "8080")))
```

Build and create image with a new tag by executing the below and replacing oamdev with your Docker Hub user name. 

```plain
docker build -t oamdev/helloworld-python:v2 .
docker push oamdev/helloworld-python:v2
```

### Step 2: Change the component properties
Change the image tag to new one (v1 => v2) in the app.yaml file. 

```plain
apiVersion: core.oam.dev/v1beta1
kind: Application
metadata:
  name: first-app
spec:
  components:
    - name: helloworld
      type: webservice
      properties:
        image: oamdev/helloworld-python:v2 # new image tag
        env:
          - name: "TARGET"
            value: "KubeVela"
        port: 8080
      traits:
        - type: ingress
          properties:
            domain: localhost 
            http:
              /: 8080
```

Apply the upgraded application

```plain
kubectl apply -f app-upgrade.yaml 
```{{exec}}


### Step 3: Verify
Call the service to check the response has changed.

```plain
curl localhost
```{{exec}}
