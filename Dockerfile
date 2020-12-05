FROM adoptopenjdk:11-jre-hotspot as builder
WORKDIR app
COPY target/*.jar demo.jar
RUN java -Djarmode=layertools -jar demo.jar extract

FROM adoptopenjdk:11-jre-hotspot
EXPOSE 8080
WORKDIR app
COPY --from=builder app/dependencies/ ./
COPY --from=builder app/spring-boot-loader/ ./
# COPY --from=builder app/snapshot-dependencies/ ./
COPY --from=builder app/application/ ./
ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]
