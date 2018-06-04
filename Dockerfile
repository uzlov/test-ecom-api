FROM node:8.9.1-alpine
ARG APP_PATH=/opt/app

WORKDIR $APP_PATH
COPY . $APP_PATH
RUN apk --no-cache add curl git && npm install

# Check every 30s to ensure this service returns HTTP 200.
# HEALTHCHECK CMD curl -fs http://localhost:$PORT/healthz || exit 1

ENV NODE_ENV development

CMD ["npm", "run", "dev"]
