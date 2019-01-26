{
  "mqtt": {
    "host": "${MQTT_HOST}",
    "port": ${MQTT_PORT},
    "protocol": "mqtt",
    "username": "${MQTT_USERNAME}",
    "password": "${MQTT_PASSWORD}",
    "rejectUnauthorized": false
  },
  "topic": {
    "discovery_prefix": "${TOPIC_DISCOVERY_PREFIX}"
  },
  "meross": {
    "email": "${MEROSS_USERNAME}",
    "password": "${MEROSS_PASSWORD}"
  },
  "devices": {
    "refresh": 10000
  }
}
