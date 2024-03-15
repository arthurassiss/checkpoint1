# Use uma imagem base com o Java e o Maven instalados
FROM maven:3.8.4-openjdk-17-slim AS builder

# Copie os arquivos de código-fonte do seu projeto para dentro do contêiner
COPY . /app

# Defina o diretório de trabalho como o diretório do seu projeto
WORKDIR /app

# Compile o seu projeto com o Maven
RUN mvn clean package -DskipTests

# Use uma imagem base mínima com o Java para a execução do seu aplicativo
FROM openjdk:17-jdk-slim

# Copie o arquivo JAR gerado na etapa anterior para dentro do contêiner
COPY --from=builder /app/target/checkpoint1-0.0.1-SNAPSHOT.jar /app/checkpoint1-0.0.1-SNAPSHOT.jar

# Exponha a porta que a aplicação Spring Boot está escutando
EXPOSE 8080

# Comando para executar a aplicação Spring Boot quando o contêiner for iniciado
CMD ["java", "-jar", "/app/checkpoint1-0.0.1-SNAPSHOT.jar"]
