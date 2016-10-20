.PHONY: all clean

all: test.elf test.bin

clean:
	rm *.o
	rm *.elf
	rm *.bin

#test.elf: test.ld test.o
#	arm-none-eabi-ld -T $< test.o -o $@

test.bin: test.elf
	arm-none-eabi-objcopy -O binary $< $@

test.elf: test.ld test.o vectors.o
	arm-none-eabi-ld -T $< test.o vectors.o -o $@

test.o: test.c
	arm-none-eabi-gcc -c -mcpu=arm926ej-s -g $< -o $@

vectors.o: vectors.S
	arm-none-eabi-as -mcpu=arm926ej-s -g $< -o $@
 
