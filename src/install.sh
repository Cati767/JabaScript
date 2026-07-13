#!/data/data/com.termux/files/usr/bin/bash

# 1. Перевірка та встановлення інструментів
echo "Жабка готує ставок..."
pkg update -y > /dev/null
pkg install clang -y > /dev/null

# 2. Компіляція (прихована від користувача)
clang jaba.c -o jaba

# 3. Переміщення в системну папку (це ключовий момент!)
# $PREFIX/bin - це папка, з якої Termux запускає всі системні команди
mv jaba $PREFIX/bin/

# 4. Перевірка
if [ -f "$PREFIX/bin/jaba" ]; then
    echo "========================================"
    echo "Успіх! Тепер просто введи: jaba"
    echo "========================================"
else
    echo "Сталася помилка, жабка не змогла переїхати."
fi

