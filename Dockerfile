#we will use maven image to package the image
FROM maven:3.8.7-openjdk-18-slim AS build

WORKDIR /app1
COPY . .
# Now we will run command to package the image
RUN mvn clean compile
RUN mvn -B -DskipTests clean package

# Now we will use openjdk image to run the java application
FROM openjdk:18-jdk-slim
# Again we will create a directory inside the container
# where will copy the jar file which was created during build 
WORKDIR /app2
# Now we will copy the jar file from build to this container
COPY --from=build /app1/target/*.jar /app2/myapp.jar
# Now we will expose the port where the container will listen
EXPOSE 8080
# Now we will run the java application
CMD ["java","-jar","myapp.jar"]
