FROM python:3.10-slim

# Install OS dependencies
RUN apt-get update && \
    apt-get install -y git g++ wget && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY requirements.txt .
COPY download_model.sh .
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Download model files
RUN chmod +x download_model.sh && ./download_model.sh

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]