# Step 1: Use a lightweight base image
FROM python:3.10-slim

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy dependency file & install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the application code
COPY . .

# Step 5: Expose the application port
EXPOSE 5000

# Step 6: Run the application
CMD ["python", "app/app.py"]
