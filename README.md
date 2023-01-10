# Example Spring Boot application with New Relic agent.

This is a simple Spring Boot application that uses the New Relic Java agent. 
Thereby the applications code will not be touched at all since the dockerized Spring-Boot application will be used as a docker base image.
The New Relic Java agent will be downloaded and installed during the docker build process of a [new docker image](newrelic/newrelic.Dockerfile) that uses the applications docker image as base image.

## Project Overview
* Kotlin 1.7
* Spring Boot 3
    * [Slf4j](src/main/kotlin/com/example/app/LogUtil.kt)
    * logger config via [application.yml](src/main/resources/application.yml)
* Gradle 7
* Gradle with Kotlin DSL
* Docker
* New Relic Java agent

## Usage
The [`run.sh` script](run.sh) show cases the build process of the docker image. The script will build the application and the docker image.
The new relic license key is passed as environment variable to the docker container.
```shell
./run.sh <new-relic-license-key>
```

:bulb: The project will [create some log entries](src/main/kotlin/com/example/app/LogOnApplicationReadyService.kt) on application start.
