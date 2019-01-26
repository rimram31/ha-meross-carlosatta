# Home Assistant Meross integration

This is a full fork from hassio carlosatta meross plugin [carlosatta hassio] discussed here [meross community ha discussion] rework to be used with Home Assistant (without hassio).

This require your system to run docker. The meross code is not changed (I'm not nodejs developer ...), this repo contain only docker changes

## How to use it

Clone the repo and first build the image on your system:
```sh
git clone ...
docker build --build-arg BUILD_FROM=alpine:3.8 -t meross-carlosatta .
```

(rem: removed BUILD_FROM for now to build image with docker hub)

Try it:
```sh
docker run --rm --name="meross-carlosatta" \
-e MQTT_HOST="<your host runnig mqtt" \
-e MQTT_PORT="<mqtt port> usually 183" \
-e MQTT_USERNAME="<if any, if not empty>" \
-e MQTT_PASSWORD="..." \
-e TOPIC_DISCOVERY_PREFIX="homeassistant" \
-e MEROSS_USERNAME="<your meross email/username>" \
-e MEROSS_PASSWORD="..." \
--net=host meross-carlosatta
```

If everything is ok you must see your devices in HA. You can integrate this container to your installation or daemon mode or as a service.

## Run the container as a service

Copy the ```meross-carlosatta.service.template``` and adapt it to your configuration

```sh
cp meross-carlosatta.service.template meross-carlosatta.service
vi/nano meross-carlosatta.service ...
```

Install the container as a service:
```sh 
sudo cp meross-carlosatta.service /etc/systemd/system/
sudo systemctl enable meross-carlosatta
sudo systemctl start meross-carlosatta
```

You can check if your container is running with docker:
```sh
docker ps
docker logs <container id>
...
```

Enjoy !

Thanks to carlosatta, this work like a charm with no other setup at all.

## To be done
Publish Docker hub image

[carlosatta hassio]: https://github.com/carlosatta/hassio-addons/tree/master/hassio_meross
[meross community ha discussion]: https://community.home-assistant.io/t/are-meross-switches-compatible-with-any-existing-components/51548/48

