FROM openjdk:8
COPY ./target/zipkin-server-2.20.2-exec.jar zipkin-server-2.20.2-exec.jar
RUN export RABBIT_URI=amqp://app_user:a880694a8723cc8781afca52be082aa6@rabbitmq:5672/messaging
CMD ["java", "-jar", "zipkin-server-2.20.2-exec.jar"]