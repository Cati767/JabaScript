#!/data/data/com.termux/files/usr/bin/bash

echo "--- JabaScript Installer ---"
read -p "Бажаєш встановити JabaScript в свою систему? (y/n) " choice

case "$choice" in 
  y|Y ) 
    echo "Створюю ставок для жаби..."
    # Тут ми імітуємо процес встановлення
    sleep 1
    echo "[1/3] Завантаження вихідних кодів..."
    sleep 1
    echo "[2/3] Компіляція Jaba-рушія..."
    gcc jaba.c -o jaba
    sleep 1
    echo "[3/3] Налаштування середовища..."
    mv jaba $PREFIX/bin/jaba
    echo "Встановлення завершено!"
    echo "Тепер ти можеш використовувати команду 'jaba'"
    ;;
  * ) 
    echo "Жабка залишилася в ставку. Бувай!"
    exit 1
    ;;
esac
