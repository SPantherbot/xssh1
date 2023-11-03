FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx openssh-server wget

# Install ngrok
RUN wget -O /ngrok.zip https://bin.equinox.io/c/your-ngrok-token/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
RUN unzip /ngrok.zip -d /usr/local/bin > /dev/null 2>&1

COPY ./ /app
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]

