FROM node:20-alpine

WORKDIR /app

# Copy only the lockfile + package.json first
COPY package*.json ./

# Install production dependencies
RUN npm ci --omit=dev

# Clean npm cache
RUN npm cache clean --force

# Copy the rest of the code
COPY . .

# Start the app
CMD ["node", "server.js"]