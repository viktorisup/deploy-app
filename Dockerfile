FROM nginx:1.27-alpine

ARG VERSION=dev
ARG COMMIT=unknown
ARG BUILD_TIME=unknown

COPY nginx.conf /etc/nginx/nginx.conf
COPY static/ /usr/share/nginx/html/

RUN sed -i "s|__VERSION__|${VERSION}|g; s|__COMMIT__|${COMMIT}|g; s|__BUILD_TIME__|${BUILD_TIME}|g" \
      /usr/share/nginx/html/index.html \
 && sed -i "s|__VERSION__|${VERSION}|g; s|__COMMIT__|${COMMIT}|g; s|__BUILD_TIME__|${BUILD_TIME}|g" \
      /usr/share/nginx/html/version.json.template \
 && mv /usr/share/nginx/html/version.json.template /usr/share/nginx/html/version.json

EXPOSE 8080