#################################################
# Imagen base para el contenedor de compilación
#################################################
FROM maven:3.9.9-eclipse-temurin-21-jammy AS builderr

# Define el directorio de trabajo donde ejecutar comandos
WORKDIR /project

# Copia las dependencias del proyecto
COPY pom.xml /project/

# Descarga las dependencias del proyecto
RUN mvn clean verify

# Copia el código del proyecto
COPY /src /project/src

# Compila proyecto
RUN mvn package -o

#################################################
# Imagen base para el contenedor de la aplicación
#################################################
FROM eclipse-temurin:21-jre

# Define el directorio de trabajo donde se encuentra el JAR
WORKDIR /usr/src/app/

# Copia el JAR del contenedor de compilación
COPY --from=builder /project/target/command-line-application.jar /usr/src/app/

# Indica el puerto que expone el contenedor
EXPOSE 8080

# Comando por defecto
ENTRYPOINT [ "java", "-jar", "command-line-application.jar" ]

# Parametro por defecto
CMD ["--server"]