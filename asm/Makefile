all:
	gcc -O3 -S -m32 asm.c -o release-x86.s
	gcc -O3 -S asm.c -o release-x86_64.s -mregparm=0
	gcc -O0 -S -m32 asm.c -o debug-x86.s
	gcc -O0 -S asm.c -o debug-x86_64.s -mregparm=0
clean:
	rm *.s
