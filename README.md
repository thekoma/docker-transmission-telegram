# transmission-telegram-docker

### To build simply run: 
```bash 
docker build -t telegram-docker . 
```

### You can change the executable to enable cross compiling:
```bash
docker build -t telegram-docker --build-arg	GOOS=linux --build-arg GOARCH=armv7```
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

Praise the maintainer of the code @pyed
\
Have Fun

\- Koma