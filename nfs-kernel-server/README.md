[← На главную](../README.md)

# nfs-kernel-server

NFS сервер. Устанавливается на машину, которая раздаёт общее хранилище.

## Собрать пакеты

```bash
# запускать из папки nfs-kernel-server/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y nfs-kernel-server && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set nfs-kernel-server
cd nfs-kernel-server && dpkg -i *.deb
# если ошибки порядка зависимостей — запустить второй раз:
dpkg -i *.deb
```
