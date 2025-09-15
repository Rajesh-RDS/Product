FROM node:20

# Install nginx
RUN apt update && apt install -y nginx

WORKDIR /app

# Copy package.json and install
COPY package*.json ./
RUN npm install

# Copy source and build
COPY . .
RUN npm run build

# Copy to nginx
RUN rm -rf /var/www/html/*
RUN cp -r dist/* /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

