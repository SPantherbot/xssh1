FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx openssh-server wget

COPY ./ /app
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
