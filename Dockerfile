FROM nginx AS builder 

# Set a working directory inside the container
WORKDIR /app

# Update system
RUN apt update

# Install dependencies
RUN apt install mkdocs -y  && \
      apt install mkdocs-material -y

# Copy the project files into the container
COPY . . 

# Build the project
RUN mkdocs build

FROM nginx:alpine

# COPY project build code to nginx server
COPY --from=builder /app/site /usr/share/nginx/html
