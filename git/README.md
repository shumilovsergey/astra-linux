[← На главную](../README.md)

# git

Система контроля версий. Нужна для работы с этим репо на серверах.
Устанавливается первой — через `scp`, до того как `git clone` становится доступен.

## Собрать пакеты

```bash
# запускать из папки git/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y git && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить на сервер (bootstrap)

```bash
# на твоей машине — скопировать на сервер:
scp git/*.deb root@<server-ip>:/tmp/git/

# на сервере:
cd /tmp/git && dpkg -i *.deb
```

### Astra Linux: фикс зависимостей perl

Astra-версия `perl-base` не совпадает с той что ожидает Debian-пакет `git`.
После `dpkg -i *.deb` perl и git окажутся в статусе "не настроен". Лечится патчем:

```bash
bash fix-astra.sh
```

