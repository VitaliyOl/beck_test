FROM node:16-slim

# Install necessary dependencies
RUN apt-get update && apt-get install -y libnss3 libatk-bridge2.0-0 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2 libpangocairo-1.0-0 libxss1

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Install Playwright with dependencies
RUN npx playwright install --with-deps

# Start the application
CMD ["node", "server.js"]