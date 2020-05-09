FROM openjdk:8
COPY ./target/zipkin-server-2.20.2-exec.jar zipkin-server-2.20.2-exec.jar
RUN export RABBIT_URI=amqp://track_user:2gULh8QzpEE9zzOnJKubveJK+yVRt9ok5sKKff+EMDZZBwR+@rabbitmq:5672/tracking
CMD ["java", "-jar", "zipkin-server-2.20.2-exec.jar"]