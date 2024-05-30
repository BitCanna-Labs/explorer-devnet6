ARG BASE_IMAGE=node:18-alpine3.18

# This is a multiple stage Dockerfile.
# - Stage 1: starter (base image with Node.js 18 and the turbo package installed globally)

# - Stage 2: builder (adds dependencies, environment variables, and builds the project using yarn)

# - Stage 3: runner (final image for the web project, sets environment variables, starts the server)

# Stage: starter
# FROM ${BASE_IMAGE} AS starter
# WORKDIR /app
# RUN npm i -g turbo

################################################################################

# Stage: builder
FROM  ${BASE_IMAGE} AS builder


### First install the dependencies (as they change less often)
COPY . /app

WORKDIR /app
## Setting up the environment variables for the docker container.

RUN yarn install 
#--inline-builds

## Build the project
RUN yarn build

CMD yarn preview --host 0.0.0.0 --port 8080
################################################################################

# Stage: runner
FROM builder AS  runner

WORKDIR /app

CMD yarn preview --host 0.0.0.0 --port 8080