FROM maven:3-jdk-8 as mvn
RUN git clone https://github.com/cicdpipelineorg/spring-petclinic.git
RUN cd spring-petclinic && mvn package
FROM openjdk:8-alpine
COPY --from=mvn spring-petclinic/target/spring-petclinic*.jar spring-petclinic.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic.jar"]