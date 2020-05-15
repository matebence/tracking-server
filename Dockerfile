FROM openjdk:8
COPY ./target/zipkin-server-2.20.2-exec.jar zipkin-server-2.20.2-exec.jar
RUN export RABBIT_URI=amqp://track_user:e19e0344779bf3cfa03f1cc2e98bd424@rabbitmq:5672/inspection
RUN export ZIPKIN_QUERY_ALLOWED_ORIGINS=http://192.168.99.100:8765
CMD ["java", "-jar", "zipkin-server-2.20.2-exec.jar"]