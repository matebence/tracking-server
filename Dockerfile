FROM openjdk:8
COPY ./target/tracking-server-0.0.1-SNAPSHOT-module.jar tracking-server-0.0.1-SNAPSHOT-module.jar
COPY ./zipkin-server-2.12.3-exec.jar zipkin-server-2.12.3-exec.jar
COPY ./wait-for-it.sh wait-for-it.sh 
RUN chmod +x wait-for-it.sh
RUN export RABBIT_URI=amqp://track_user:e19e0344779bf3cfa03f1cc2e98bd424@rabbitmq:5672/inspection
CMD ["./wait-for-it.sh" , "user-service:7200" , "--strict" , "--timeout=230" , "--" , "java", "-Dloader.path=tracking-server-0.0.1-SNAPSHOT-module.jar,tracking-server-0.0.1-SNAPSHOT-module.jar!/lib", "-Dspring.application.name=tracking-server", "-cp", "zipkin-server-2.12.3-exec.jar", "org.springframework.boot.loader.PropertiesLauncher", "--eureka.client.service-url.defaultZone=http://app-blesk-naming-server:b1477e9ba7723b8f47e9727a39a51edf@naming-server:8761/eureka", "--spring.security.user.name=app-blesk-tracking-server", "--spring.security.user.password=59fe09743cb9ef59276464f81734a003", "--spring.security.basic.enabled=true"]