# Set a specific version of the base image
FROM devisty/xssh:v2.1

# Use a non-root user
RUN useradd -m appuser
USER appuser

# Install dependencies
RUN apt-get update && apt-get install -y \
    nginx=1.18.* \
    && rm -rf /var/lib/apt/lists/*

# Copy application code
COPY ./ /app

# Set permissions and ownership
RUN chmod +x /app/start.sh \
    && chown -R appuser:appuser /app

# Expose port
EXPOSE 80

# Start the application
CMD ["/app/start.sh"]
