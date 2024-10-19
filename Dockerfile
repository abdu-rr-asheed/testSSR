# Use an official Node runtime as the base image
FROM node:20-alpine as build

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the application code
COPY . .

# Build the Angular app for production
RUN npm run build -- --configuration production

# Use Nginx to serve the built application
FROM nginx:alpine

# Copy the built app to Nginx's serve directory
COPY --from=build /app/dist/test-nl/browser /usr/share/nginx/html

# Copy a custom Nginx configuration if needed
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
