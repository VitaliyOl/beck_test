FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Run Playwright installation with root privileges
USER root
RUN npx playwright install --with-deps

# Expose port 10000
EXPOSE 10000

CMD ["node", "server.js"]
