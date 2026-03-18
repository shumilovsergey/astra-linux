[← На главную](../README.md)

# tools

Утилиты для работы с пакетами на Astra Linux 1.8.

## fix-astra-deps.sh

Универсальный фикс конфликтов зависимостей. Запускать после `dpkg -i *.deb`
если пакеты остались в статусе "не настроен".

**Проблема:** Debian 12 пакеты требуют точные версии зависимостей `(= X.Y.Z+deb12uN)`,
но Astra 1.8 поставляет те же пакеты с патчеными версиями `(+astraN, +ciXXX)`.
dpkg не может сопоставить версии и оставляет пакеты ненастроенными.

**Решение:** скрипт ослабляет все `(= version)` → `(>= version)` в базе dpkg,
после чего `dpkg --configure -a` успешно завершает настройку.

### Использовать

```bash
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh | bash
```

Скрипт запускает `dpkg --configure -a` до 10 раз — каждый проход разблокирует следующий слой
зависимостей. Завершается раньше если все пакеты настроены успешно.

Если 10 итераций не хватает (маловероятно) — скачать скрипт, изменить число в цикле и запустить вручную:

```bash
curl -s https://raw.githubusercontent.com/shumilovsergey/astra-linux/main/tools/fix-astra-deps.sh -o fix.sh
# отредактировать: for i in 1 2 3 ... N
bash fix.sh
```
