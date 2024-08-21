FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /app

COPY package*.json ./

# Install dependencies
RUN npm install

COPY . .

# Ensure necessary browsers are installed with appropriate permissions
RUN chmod -R 777 /ms-playwright && npx playwright install --with-deps

CMD ["node", "server.js"]
