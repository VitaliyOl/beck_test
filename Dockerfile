FROM mcr.microsoft.com/playwright:v1.46.1-focal

USER root
RUN apt-get update && apt-get install -y xvfb
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# Запуск через xvfb-run
CMD ["xvfb-run", "--auto-servernum", "--server-args='-screen 0 1024x768x24'", "node", "server.js"]
