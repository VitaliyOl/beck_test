FROM mcr.microsoft.com/playwright:v1.46.1-focal

# Install dependencies
RUN apt-get update && apt-get install -y \
    xvfb

# Switch to root to avoid permission issues
USER root

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Start the application with xvfb-run to provide a virtual display
CMD ["xvfb-run", "--", "node", "server.js"]
