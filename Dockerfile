# Stage 1: Build the application
FROM node:14 AS build

# Set the working directory
WORKDIR /app

# Copy your application's package.json and package-lock.json
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of your application's source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Create the final image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app/dist ./dist
COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules

# Define the command to start your application
CMD [ "node", "dist/app.js" ]
