FROM app:latest

USER 0

ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"

RUN apk --no-cache add wget

RUN wget -P /app/libs "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/7.11.1/newrelic-agent-7.11.1.jar"

ADD newrelic.yml /app/libs

USER 4711

ENTRYPOINT ["java", "-javaagent:/app/libs/newrelic-agent-7.11.1.jar", "-Xmx2048m", "-cp", "/app/resources:/app/classes:/app/libs/*", "com.example.app.SpringBootNewrelicExampleApplicationKt"]

