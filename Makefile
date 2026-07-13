TARGET = jaba
INSTALL_DIR = /usr/local/bin

all:
	gcc -O3 jaba.c -o $(TARGET)

install: all
	sudo cp $(TARGET) $(INSTALL_DIR)
	@echo "Jaba успішно встановлена! Тепер просто введи 'jaba'"

clean:
	rm -f $(TARGET)
