# Use the official Python base image
FROM python:3.11.8-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY analytics/requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY analytics/ .

# Expose the port the application runs on
EXPOSE 5153

# Define the command to run the application
CMD ["python", "app.py"]
