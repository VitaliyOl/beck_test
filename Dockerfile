FROM mcr.microsoft.com/playwright:v1.46.1-focal

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Ensure necessary browsers are installed
RUN npx playwright install --with-deps

CMD ["node", "server.js"]
