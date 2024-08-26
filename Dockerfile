# Usa una imagen base de Maven para construir el proyecto
FROM maven:3.8.1-openjdk-17 AS build

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo pom.xml y descarga las dependencias necesarias
COPY pom.xml .

# Descarga las dependencias de Maven (esto se almacenará en caché si pom.xml no cambia)
RUN mvn dependency:go-offline -B

# Copia el código fuente de la aplicación
COPY src ./src

# Construye la aplicación y genera un archivo JAR
RUN mvn clean package -DskipTests

# Usa una imagen base ligera de Java para ejecutar la aplicación
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo JAR generado desde la fase de construcción
COPY --from=build /app/target/rxjava-azure-0.0.1.jar ./rxjava-azure-0.0.1.jar

# Expone el puerto 8080
EXPOSE 8080

# Define el comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "rxjava-azure-0.0.1.jar"]
