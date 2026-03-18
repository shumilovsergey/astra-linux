[← На главную](../README.md)

# postgresql

СУБД PostgreSQL. На Debian 12 устанавливается версия 15.

## Собрать пакеты

```bash
# запускать из папки postgresql/
docker run --rm --platform linux/amd64 -v $(pwd):/output debian:12 bash -c \
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
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

> Ошибки `mailcap` / `bsd-mailx` можно игнорировать — они не влияют на PostgreSQL.

После этого кластер не создаётся автоматически — создать вручную:

```bash
pg_createcluster 15 main --start
```

## Проверка

```bash
psql --version
pg_lsclusters
# ожидаемо: Ver=15, Cluster=main, Status=online
```
