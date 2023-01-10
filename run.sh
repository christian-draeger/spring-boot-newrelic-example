./gradlew clean bootJar dockerBuildImage
docker build -t spring-boot-newrelic-example -f ./newrelic/newrelic.Dockerfile ./newrelic

docker run -p 8080:8080 --env NEW_RELIC_LICENSE_KEY=$1 --env NEW_RELIC_APP_NAME=Example spring-boot-newrelic-example
