FROM alpine:3.8

USER root
ENV LANG C.UTF-8

ENV MQTT_HOST ''
ENV MQTT_PORT 1883
ENV MQTT_USERNAME ''
ENV MQTT_PASSWORD ''
ENV TOPIC_DISCOVERY_PREFIX 'homeassistant'
ENV MEROSS_USERNAME ''
ENV MEROSS_PASSWORD ''

RUN apk add --no-cache nodejs nodejs-npm gettext

WORKDIR /usr/src/hassio_meross
    
COPY package*.json ./
COPY options.json.tpl ./
RUN mkdir /data

RUN npm install

COPY app.js .
COPY lib /usr/src/hassio_meross/lib

COPY run.sh /
RUN chmod a+x /run.sh

#CMD [ "/run.sh" ]
CMD ["sh","-c","envsubst <./options.json.tpl >/data/options.json && /run.sh"]
