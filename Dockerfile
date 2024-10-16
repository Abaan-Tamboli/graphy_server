# Use the latest Node.js image based on Debian Bullseye or Alpine
FROM node:20.18-alpine


# Install patched version of git and other required packages
RUN apt-get update && \
    apt-get install -y git=1:2.20.1-2+deb10u9 && \
    apt-get install -y e2fsprogs=1.46.2-2+deb11u1 && \
    apt-get install -y sqlite3=3.34.1-3+deb11u1 libsqlite3-dev=3.34.1-3+deb11u1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /usr/src/app

# Copy project files
COPY package.json ./
COPY UScities.json ./
COPY graphserver.js ./

# Install project dependencies
RUN npm install

# Expose the application port
EXPOSE 4000

# Start the application
CMD ["node", "graphserver.js"]
