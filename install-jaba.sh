#!/bin/bash
# Скрипт інсталяції Jaba

echo "--- Встановлення JabaScript ---"
# Створюємо папку, куди все скачаємо
mkdir -p ~/.jaba
cd ~/.jaba

# Тут ми могли б клонувати твій репозиторій з GitHub
# https://github.com/Cati767/JabaScript .

# Для прикладу - компіляція
gcc -O3 jaba.c -o jaba

# Додаємо в PATH, якщо ще не там
if [[ ":$PATH:" != *":$HOME/.jaba:"* ]]; then
    echo 'export PATH="$HOME/.jaba:$PATH"' >> ~/.bashrc
    echo 'export PATH="$HOME/.jaba:$PATH"' >> ~/.zshrc
    echo "Jaba додана в PATH. Перезапустіть термінал або виконайте 'source ~/.bashrc'"
fi

echo "--- Готово! Тепер можна писати 'jaba' ---"
