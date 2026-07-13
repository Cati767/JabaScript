JabaScript
JabaScript — езотерична мова програмування для керування пам'яттю (ставком).
Встановлення
Створіть домашню папку та перейдіть у неї:
mkdir ~/jaba-lang
cd ~/jaba-lang
Перенесіть файли (src/jaba.c, install.sh) та запустіть інсталяцію:
chmod +x install.sh
./install.sh
Використання
Команда jaba доступна з будь-якої директорії.
Запуск програми:
jaba [файл.jaba]
Довідка:
jaba gimme-pad
Команди
spawn: +1
die: -1
leap: ->
retreat: <-
croak: вивести символ
observe: ввід користувача
drown: 0
tadpole: +10
bullfrog: ->5
lilypad: пробіл
ribbit: вивести число
metamorphosis: *2
hibernation: /2
camouflage: інвертувати
migrate: скинути позицію
predator: випадковий стрибок
swamp_gas: випадкове значення
reproduce: копіювати в наступну клітинку
sunbathe: +50
render: показати ставок
summon: викликати файл
gimme-pad: довідка
burrow: вихід
Troubleshooting
Якщо виникають помилки:
Permission denied (Termux): Не запускайте скрипти зі спільних папок Android (/storage/shared/). Працюйте тільки в домашній папці (home).
Команда не знайдена: Переконайтеся, що ви запустили ./install.sh, який копіює бінарник у системний $PREFIX/bin.
Could not open file: Перевірте назву файлу та чи знаходиться він у тій самій папці.
Приклад програми (hello.jaba)
tadpole tadpole tadpole lilypad tadpole tadpole croak