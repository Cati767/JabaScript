#!/data/data/com.termux/files/usr/bin/bash

echo "--- Встановлення JabaScript ---"

# 1. Перевірка наявності бінарника
if [ ! -f "bin/jaba" ]; then
    echo "Помилка: Файл bin/jaba не знайдено."
    echo "Спочатку скомпілюй проєкт: clang src/jaba.c -o bin/jaba"
    exit 1
fi

# 2. Копіювання в систему
cp bin/jaba $PREFIX/bin/
chmod +x $PREFIX/bin/jaba

echo "--- Успіх! Тепер просто введи 'jaba' ---"
