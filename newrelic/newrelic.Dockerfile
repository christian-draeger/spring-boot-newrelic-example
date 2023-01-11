FROM app:latest

USER 0

ENV NEW_RELIC_LOG_FILE_NAME="STDOUT"

RUN apk --no-cache add wget

# download New Relics Java APM agent and add it to classpath
RUN wget -P /app/libs "https://download.newrelic.com/newrelic/java-agent/newrelic-agent/7.11.1/newrelic-agent-7.11.1.jar"

# download New Relics logback extension and add it to classpath
## since spring-boot is using logback by default we add the New Relic logback extension to oiur classpath. for further information see: https://docs.newrelic.com/docs/logs/logs-context/java-configure-logs-context-all/#logback
#RUN wget -P /app/libs "https://repo1.maven.org/maven2/com/newrelic/logging/logback/2.6.0/logback-2.6.0.jar"

# add New Relic APM agent config to classpath
ADD newrelic.yml /app/libs

# add custom logback config that uses New Relic logback appender
#ADD logback-spring.xml /app/libs

USER 4711

# run Spring-Boot app with static load of New Relic Java Agent
ENTRYPOINT ["java", "-javaagent:/app/libs/newrelic-agent-7.11.1.jar", "-Xmx2048m", "-cp", "/app/resources:/app/classes:/app/libs/*", "com.example.app.SpringBootNewrelicExampleApplicationKt"]

