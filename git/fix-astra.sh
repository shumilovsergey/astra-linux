#!/bin/bash
set -e

cp /var/lib/dpkg/status /var/lib/dpkg/status.bak

python3 << 'PY'
with open('/var/lib/dpkg/status', 'r') as f:
    content = f.read()
content = content.replace('perl-base (= 5.36.0-7+deb12u3)', 'perl-base (>= 5.36.0-7)')
content = content.replace('libperl5.36 (= 5.36.0-7+deb12u3)', 'libperl5.36 (>= 5.36.0-7)')
with open('/var/lib/dpkg/status', 'w') as f:
    f.write(content)
print('Patched OK')
PY

dpkg --configure -a
git --version
