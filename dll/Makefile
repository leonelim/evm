all:
	gcc -shared -fpic dll.c -o dll.so
	gcc test.c -L . -l:dll.so -o test
clean:
	rm test dll.so
