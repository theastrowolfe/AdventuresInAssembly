EXECS = hello loops memory calling external add42 fib reverse

hello: clean
	nasm -f elf32 hello.asm -o hello.o
	ld -m elf_i386 hello.o -o hello

loops: clean
	nasm -f elf32 loops.asm -o loops.o
	ld -m elf_i386 loops.o -o loops

memory: clean
	nasm -f elf32 memory.asm -o memory.o
	ld -m elf_i386 memory.o -o memory

calling: clean
	nasm -f elf32 calling.asm -o calling.o
	ld -m elf_i386 calling.o -o calling

external: clean
	nasm -f elf32 external.asm -o external.o
	gcc -m32 external.o -o external

add42: clean
	nasm -f elf32 add42.asm -o add42.o
	gcc -m32 add42.o add42.c -o add42

fib: clean
	nasm -f elf32 fib.asm -o fib.o
	gcc -m32 fib.o -o fib

reverse: clean
	nasm -f elf32 reverse.asm -o reverse.o
	gcc -m32 reverse.o -o reverse

clean:
	rm -f *.o $(EXECS)

