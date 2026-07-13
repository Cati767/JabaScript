#!/data/data/com.termux/files/usr/bin/bash

# Переходимо в директорію, де лежить скрипт
cd "$(dirname "$0")"

echo "--- JabaScript: Розгортання ---"

# 1. Перевірка наявності вихідного коду
if [ ! -f "src/jaba.c" ]; then
    echo "Помилка: Файл src/jaba.c не знайдено!"
    exit 1
fi

# 2. Встановлення компілятора
pkg install clang -y > /dev/null

# 3. Створення робочих папок
mkdir -p bin

# 4. Компіляція (перетворюємо код на бінарний файл)
echo "Компілюю src/jaba.c..."
clang src/jaba.c -o bin/jaba

# 5. Копіювання в систему (щоб працювала команда 'jaba')
echo "Встановлюю в систему..."
cp bin/jaba $PREFIX/bin/jaba
chmod +x $PREFIX/bin/jaba

echo "--- Готово! Введи 'jaba gimme-pad' ---"

