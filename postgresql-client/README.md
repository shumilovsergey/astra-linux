[← На главную](../README.md)

# postgresql-client

Клиент PostgreSQL. Нужен для проверки подключения к удалённой БД (`psql`).

## Собрать пакеты

```bash
# запускать из папки postgresql-client/
docker run --rm --platform linux/amd64 -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y postgresql-client && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set postgresql-client
cd postgresql-client && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
psql --version
```
