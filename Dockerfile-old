# Usa una imagen base de OpenJDK
FROM openjdk:17-jdk-slim AS build

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de Maven Wrapper y el archivo pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Da permisos de ejecución al script mvnw
RUN chmod +x mvnw

# Descarga las dependencias usando el Maven Wrapper
RUN ./mvnw dependency:go-offline

# Copia el código fuente
COPY src ./src

# Construye el JAR usando el Maven Wrapper
RUN ./mvnw package -DskipTests

# Usa una imagen base de OpenJDK para la etapa de ejecución
FROM openjdk:17-jdk-slim

# Copia el JAR construido desde la etapa anterior
COPY --from=build /app/target/rxjava-azure-0.0.1.jar /app/rxjava-azure-0.0.1.jar

# Exponer el puerto 8091 para el contenedor
#EXPOSE 8091

# Establece el comando por defecto
ENTRYPOINT ["java", "-jar", "/app/rxjava-azure-0.0.1.jar"]
