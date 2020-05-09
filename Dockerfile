FROM openjdk:8
COPY ./target/zipkin-server-2.20.2-exec.jar zipkin-server-2.20.2-exec.jar
RUN export RABBIT_URI=amqp://rabbitmq
CMD ["java", "-jar", "zipkin-server-2.20.2-exec.jar"]