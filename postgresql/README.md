[← На главную](../README.md)

# postgresql

СУБД PostgreSQL. На Debian 12 устанавливается версия 15.

## Собрать пакеты

```bash
# запускать из папки postgresql/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y postgresql && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set postgresql
cd postgresql && dpkg -i *.deb
```
