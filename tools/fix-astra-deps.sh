#!/bin/bash
# Универсальный фикс зависимостей для Astra Linux 1.8
#
# Проблема: пакеты Debian 12 имеют точные зависимости вида (= X.Y.Z+deb12uN).
# Astra Linux 1.8 поставляет те же пакеты с патчеными версиями (суффиксы +astraN, +ciXXX).
# dpkg не может настроить пакеты, потому что версии не совпадают точно.
#
# Решение: ослабить все точные зависимости (=) до (>=) в базе dpkg.
# Запускать после каждого dpkg -i *.deb если пакеты остались "не настроены".

echo "Backup: /var/lib/dpkg/status -> /var/lib/dpkg/status.bak"
cp /var/lib/dpkg/status /var/lib/dpkg/status.bak

echo "Patching..."
python3 << 'PY'
import re

with open('/var/lib/dpkg/status', 'r') as f:
    content = f.read()

original = content

def relax_line(match):
    return match.group(0).replace('(= ', '(>= ')

content = re.sub(r'^((?:Depends|Pre-Depends):.*)', relax_line, content, flags=re.MULTILINE)

patched = sum(1 for a, b in zip(original.splitlines(), content.splitlines()) if a != b)
print(f'Patched {patched} lines')

with open('/var/lib/dpkg/status', 'w') as f:
    f.write(content)
PY

echo "Configuring pending packages..."
for i in 1 2 3 4 5 6 7 8 9 10; do
    echo "Pass $i..."
    dpkg --force-depends --configure -a 2>/dev/null && break
done

echo "Done."
