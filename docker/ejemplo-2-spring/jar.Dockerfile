# Selecciona la imagen base
FROM eclipse-temurin:21-jre

# Define el directorio de trabajo para el comando
WORKDIR /usr/src/app/

# Copia de la aplicación compilada
COPY target/*.jar /usr/src/app/

# Indica el puerto que expone el contenedor
EXPOSE 8080

# Comando que se ejecuta al hacer docker run
CMD [ "java", "-jar", "spring-webapp-0.1.0.jar" ]