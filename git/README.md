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

### Astra Linux: фикс зависимостей

После `dpkg -i *.deb` пакеты могут остаться "не настроены" из-за Astra-патченых версий:

```bash
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Установить с GitHub (если git уже есть)

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set git
cd git && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
git --version
```
