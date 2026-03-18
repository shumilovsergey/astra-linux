[← На главную](../README.md)

# nfs-common

NFS клиент. Нужен на машинах, которые монтируют NFS-раздел.

## Собрать пакеты

```bash
# запускать из папки nfs-common/
docker run --rm -v $(pwd):/output debian:12 bash -c \
  "apt-get update -qq && \
   apt-get install -d -y nfs-common && \
   cp /var/cache/apt/archives/*.deb /output/"
```

## Установить с GitHub

```bash
git clone --filter=blob:none --sparse https://github.com/shumilovsergey/astra-linux.git
cd astra-linux
git sparse-checkout set nfs-common
cd nfs-common && dpkg -i *.deb
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

## Проверка

```bash
showmount --version
```
