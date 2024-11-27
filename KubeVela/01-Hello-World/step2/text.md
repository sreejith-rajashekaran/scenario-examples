The following instructions will lead you deploy the image that you build in the previous stage. 

### Step 1: Determine Component Type 
Next setp is to determine the type of your component, namely, the runtime workload inside which you expect your containerized application runs.

According to our sample application, we need a container runtime that can accept an ENV parameter named TARGET and is capable of exposing a port for external to access the service. Furthermore, the application is stateless and can be replicated.

Currently, KubeVela provides several out-of-box types of component, webservice, worker and task, After checking the usage of each type through KubeVela cli vela components, we can figure out that, webservice matches our requirements to deploy the application.

```plain
vela components
cd app
```{{exec}}

Now we have determined to use webservice as our component's type


### Step 2: Choose Traits For Each Component
Once component type is decided, you may need to append specific operational characteristics (Traits) to your components. In this sample, we need to expose the service of our python app to outside of Kubernetes cluster. Let's check which traits can help here.

```plain
vela traits
```{{exec}}

Apparently, ingress is exactly what we need.


### Step 3: Assemble Components & Traits In Application
Once component type and trait are both choosen, we can assemble them in an Application entity. To author an Application file, you must know the configurable points of the component type as well as traits, then you can fulfill their properties fields according to your needs.

Check the configurable points (properties) of a component type

```plain
vela show ingress
```{{exec}}

Check the configurable points (properties) of a trait

```plain
vela show webservice
```{{exec}}

Pick up the properties we need and create a app.yaml file in "app" folder using the editor. Copy past the below configuration. 

```plain
apiVersion: core.oam.dev/v1beta1
kind: Application
metadata:
  name: first-app
spec:
  components:
    - name: helloworld
      type: webservice # <=== component type
      properties: # <=== component properties
        image: oamdev/helloworld-python:v1
        env:
          - name: "TARGET"
            value: "KubeVela"
        port: 8080
      traits:
        - type: ingress # <=== trait type
          properties: # <=== trait properties
            domain: localhost 
            http:
              /: 8080
```
Once the file is created, apply the yaml file 

```plain
kubectl apply -f app.yaml
```{{exec}}


### Step 4: Verify

We can check the application through KuveVela cli.

```plain
vela ls
```{{exec}}

And call the service by cURL tool

```plain
curl localhost
```{{exec}}
