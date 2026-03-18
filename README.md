## Test

This is a test repository to implement some basic integration between Azure and github actions using an example Java application

## Java Application

- Example Java application that returns a string from a properties file to a ping endpoint
- The ping endpoint is defined with swagger and REST
- It compiles the REST endpoint to Java classes
- In Java it just does the @RestController and implements the classes
- One simple junit test
- One simple Karate test

Java Version: 21
Java AOT if possible (TBC reflection with REST

## Create basic Azure infra

Will include at least:

- Keyvault
- ACR: Azure container registry
- Azure Artifacts
- Azure Container Apps

## CI pipeline

Implement in github actions:

Create a CI pipeline that:
- compiles the java app
- As validation it will run the junit tests
- saves the jar file to azure artifacts
- If brach main, run deployment with jacoco included (azure container apps?)
- Run Karate tests (Integration tests) to the jacoco instance
- stop the deployment and deploy in pre
- Rerun karate tests in pre



