#!/bin/bash
echo "--- Встановлення JabaScript ---"

# 1. Спочатку перевіряємо чи є зброя (компілятор)
if ! command -v gcc &> /dev/null; then
    echo "Помилка: GCC не знайдено. Встанови його через 'pkg install clang' або 'sudo apt install gcc'."
    exit 1
fi

# 2. Створюємо папку
mkdir -p ~/.jaba
# Важливо: файл jaba.c має бути там, де лежить скрипт, або пропиши шлях до нього
cp jaba.c ~/.jaba/
cd ~/.jaba

# 3. Компіляція
echo "Компілюю Jaba-рушій..."
gcc -O3 jaba.c -o jaba

# 4. Додаємо в PATH
if [[ ":$PATH:" != *":$HOME/.jaba:"* ]]; then
    echo 'export PATH="$HOME/.jaba:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.jaba:$PATH"' >> ~/.zshrc
    echo "Jaba додана в PATH."
fi

echo "--- Готово! Тепер можна писати 'jaba' ---"
echo "Не забудь виконати: source ~/.bashrc"

