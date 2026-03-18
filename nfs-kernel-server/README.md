[← На главную](../README.md)

# nfs-kernel-server

NFS сервер. Устанавливается на машину, которая раздаёт общее хранилище.

## Собрать пакеты

```bash
# запускать из папки nfs-kernel-server/
docker run --rm --platform linux/amd64 -v $(pwd):/output debian:12 bash -c \
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
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
systemctl enable nfs-kernel-server --now
systemctl status nfs-kernel-server --no-pager
```
