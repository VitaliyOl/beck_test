FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /app

COPY package*.json ./

RUN npm install

# Run Playwright installation with root privileges
USER root
RUN npx playwright install --with-deps

COPY . .

CMD ["node", "server.js"]
