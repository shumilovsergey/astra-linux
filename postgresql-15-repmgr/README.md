[← На главную](../README.md)

# postgresql-15-repmgr

Менеджер репликации PostgreSQL. Обеспечивает мониторинг и автоматический failover
в кластере primary/standby. Версия для PostgreSQL 15.

## Собрать пакеты

```bash
# запускать из папки postgresql-15-repmgr/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y postgresql-15-repmgr && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set postgresql-15-repmgr
cd postgresql-15-repmgr && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
repmgr --version
```
