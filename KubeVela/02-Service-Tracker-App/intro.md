This is an example microservices application with a Javascript Web UI, a Postgres database, and a series of API microservices. The idea is that various app developers would create Components for their corresponding apps. The overall config will add traits and allow the app to be fully deployed. 

The application being deployed is shown in the following diagram:
(assets/service-tracker-diagram.png)

Full application original source here: https://github.com/chzbrgr71/service-tracker

In this example, there are various roles that handle each aspect of the OAM application.

- UI Developer
- API Microservices Developer
- Postgres Admin
- App Operator / SRE (handles application deployment in Kubernetes)

#### Please note: Kindly wait till a folder called KubeVelaManifest gets created in the Editor, marking the completion of the infrastructure set up, before you start the scenario. 