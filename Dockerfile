# Use an official Python runtime as a parent image
FROM python:3.7-alpine
# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the environment variable for Flask
ENV FLASK_APP=app.py


# Define the command to run when the container starts
CMD ["flask", "run", "--host", "0.0.0.0"]
