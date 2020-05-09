FROM openjdk:8
COPY ./target/zipkin-server-2.20.2-exec.jar zipkin-server-2.20.2-exec.jar
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["RABBIT_URI=amqp://rabbitmq", "java", "-jar", "zipkin-server-2.20.2-exec.jar"]