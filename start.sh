#!/bin/bash
source /app/config.sh

# Start SSH service
service ssh start

# Start NGINX service
service nginx start

# Set ngrok token
echo "set ngrok token: $NGROK_TOKEN"
ngrok authtoken $NGROK_TOKEN

# Start ngrok service and redirect output to a log file
echo "start ngrok service"
ngrok tcp -timeout 2h 2222 log=stdout > ngrok.log
