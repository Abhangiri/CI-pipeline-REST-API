# Use a python base image
FROM python:3.9-slim 

# Set environment variables
ENV FLASK_APP=run.py
ENV FLASK_DEBUG=1 
ENV DATABASE_URI=mysql+pymysql://root:Admin%40123@host.docker.internal:3306/student_db1

# Set the working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . /app

# Expose the Flask port
EXPOSE 5000

# Run the Flask app
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
