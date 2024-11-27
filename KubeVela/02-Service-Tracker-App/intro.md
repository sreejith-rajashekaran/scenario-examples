This is an example microservices application with a Javascript Web UI, a Postgres database, and a series of API microservices. The idea is that various app developers would create Components for their corresponding apps. The overall config will add traits and allow the app to be fully deployed. 

Full application original source here: https://github.com/chzbrgr71/service-tracker

In this example, there are various roles that handle each aspect of the OAM application.

- UI Developer
- API Microservices Developer
- Postgres Admin
- App Operator / SRE (handles application deployment in Kubernetes)