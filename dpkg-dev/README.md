[← На главную](../README.md)

# dpkg-dev

Инструменты для работы с deb-пакетами. Содержит `dpkg-scanpackages` —
нужен для пересборки индекса локального apt-репозитория.

## Собрать пакеты

```bash
# запускать из папки dpkg-dev/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y dpkg-dev && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set dpkg-dev
cd dpkg-dev && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
dpkg-scanpackages --version
```
