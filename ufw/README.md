[← На главную](../README.md)

# ufw

Файрвол. Нужен на каждом сервере.

## Собрать пакеты

```bash
# запускать из папки ufw/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y ufw && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set ufw
cd ufw && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
ufw --version
```
