# Use the official Golang image
FROM golang:1.16-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files
COPY go.mod ./
# COPY go.sum ./

# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Copy the source from the current directory to the Working Directory inside the container
COPY *.go ./

# Build the Go app
RUN go build -o /hello-world

# Expose port 8080 to the outside world
EXPOSE 8080

# Command to run the executable
CMD [ "/hello-world" ]
