# transmission-telegram-docker

### To build simply run: 
```bash 
docker build -t telegram-docker . 
```

### You can change the executable to enable cross compiling:
```bash
docker build -t telegram-docker --build-arg	GOOS=linux --build-arg GOARCH=armv7
```

### Usage:

```bash
docker run \
      -e TELEGRAM_TRANSMISSION_BOT=XXXXXXXX:YourBotToken \
      -e TELEGRAM_USERNAME=YourNickname \
      -e TRANSMISSION_URL=http://transmission:9091 \
      -e TRANSMISSION_USERNAME=admin \
      -e PASS=admin \
      telegram-docker
```

### Docker Compose:
```yaml
#This is only an example.
version: '3.7'
networks:
  local: {}
services:
  transmission:
    container_name: transmission
    environment:
      - PUID=${PUID_DOCKUSER}
      - PGID=${PGID_APPZ}
    image: linuxserver/transmission
    networks:
      - local
    hostname: 'transmission'
    volumes:
      - ${CONFIG}/transmission:/config
      - ${DATA}/transmission/downloads:/downloads
    ports:
      - 9091:9091

  telegram-transmission-bot:
    container_name: telegram-transmission-bot
    build: github.com/Koma-Andrea/docker-transmission-telegram
    restart: on-failure
    depends_on:
      - transmission
    networks:
      - local
    environment:
      - TELEGRAM_TRANSMISSION_BOT=XXXXXXXX:YourBotToken
      - TELEGRAM_USERNAME="first_admin_username second_admin_username"
      - TRANSMISSION_URL=http://transmission:9091/transmission/rpc/
      - TRANSMISSION_USERNAME=admin
      - PASS=admin

```

Praise the maintainer of the code [@pyed](https://github.com/pyed/) for his work on [pyed/transmission-telegram](https://github.com/pyed/transmission-telegram)
\
Have Fun

\- Koma