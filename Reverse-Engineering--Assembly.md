
2025-05-13 10:51


Tags:[[reverseengineering]] [[assembly]]


# Reverse-Engineering--Assembly

Assembly

Computer Instructor ---> Human Readable Code


Every C Program.
Heap --
 Area in memory _--_ Manual memory allocation(Malloc, Calloc,Global, Static) 
	

Stack -- Data Structure --> Push and Pop
Each element is assigned an address--> Higher -> Lower Address
Any function is build with --> Stack Frame <-- Important
All the local variable will be stored in that Stack Frame

esp register -> Stack Pointer, Contains top element address

ebp register -> Base Pointer,  Contains base address of the stack frame

	


Register------
32 Bit and 64 Bit(Basically Small Storage,can store anything < 8 byte(Memory Address, Value))

In x86 Architecture -- 6 General Purpose Register

eax, ebx
ecx, edx   --> Used as needed basis
esi, edi

Also Some reserved register
ebp, esp, eip

Instructions


## Two Syntax assembly is normally written in

 1. AT&T 
 2. Intel


# Instruction Format

## 1. Operation (1 or two argument)
## 2. Argument


``` Assembly
mov arg1, arg2
```

this copies arg2 -> arg1

Understanding []
![[Pasted image 20250513112553.png]]

# Add instruction
add arg1,arg2
what happens is arg1 = arg1 + arg2

# Sub instruction
sub arg1,arg2
what happens is arg1 = arg1 - arg2


# Push instruction
push arg

increases stack pointer -> making space for the argument
then places the argument to the stack pointer that it is pointing

# Pop instruction
Takes a register as argument
pop reg

It will move the top element into the given register. Then increment the stack pointer thus poping the top element of the stack .


# Lea Instruction(Load effective address)

lea reg, address
Places the address into the register.(Obtaining a pointer into a memory region)
## EIP Register - > Instruction pointer
will always contain the instruction that is currently being executed.

# Compare instruction
cmp arg1, arg2

create a flag that will contain either 0 or < 0
and that will be determined by arg1 - arg2

so flag = (arg1 - arg2) -> will store only 0 or <0 

# Compare instruction will always followed by a jump instruction

jmp address

It will check the current state of the flag, and according to the state of the flag --> set the instruction pointer to its argument(address) -> will jump to the address according to the flag state 

### Many Types of jump instruction
1. je --> jump if equal to
2. jne --> jump if not equal to
3. jg --> jump if greater than 

# Leave/Return Instruction

leave
ret

destroys the current stack frame by setting the stack pointer to the
base pointer and poping the base pointer off the top of the stack

# Call instruction
calls a function. Takes 1 argument.
call (function)

push eip
jmp (function)
It will push the return address of the function being called,Then move EIP to the first instruction of the function.

## Word

word -> 2 bytes
dword -> 4 bytes
qword -> 8 bytes


```
0000000000001135 <main>:
    1135:       55                      push   rbp
					Save base pointer by pushing it into the stack
    1136:       48 89 e5                mov    rbp,rsp
					stack pointer is copied to base pointer
					base pointer now points to stack pointer
    1139:       48 83 ec 10             sub    rsp,0x10
					 Allocate 16 byte on the stack
    113d:       c7 45 fc 05 00 00 00    mov    DWORD PTR [rbp-0x4],0x5
						Stores 5 in location rbp-0x4 address
    1144:       48 8d 3d b9 0e 00 00    lea    rdi,[rip+0xeb9]        # 2004 <_IO_stdin_used+0x4>
						Load the address of the string(rip+0xeb9) to rdi register
    114b:       e8 e0 fe ff ff          call   1030 <puts@plt>
						Calls the puts function to print the previously loaded string
    1150:       90                      nop
    1151:       c9                      leave  
    1152:       c3                      ret    
    1153:       66 2e 0f 1f 84 00 00    nop    WORD PTR cs:[rax+rax*1+0x0]
    115a:       00 00 00
    115d:       0f 1f 00                nop    DWORD PTR [rax]

```

# Video - 2

### Linux Assembly 64 Bit Assembly

Function  -> Instructions


## Mov Instruction

```
MOV Destination,Source
```

```
mov rax,0x1
```

## CMP Instruction

```
CMP Destination, Source
```

```
cmt predefinedPass, myinput
```

Creates another register *zeroFlag* to store the value of the compare.
If true *zeroFlag* will store *1*
else it will store *0*

## Test Instruction
```
Test value, value
```

Tests if the value of a register is *0* or not. 

Creates another register *zeroFlag* to store the value of the test.
If true *zeroFlag* will store *1*
else it will store *0*

## Jmp Instruction

```
Jmp Destination
```
Jumps to the given instruction

## JE / JZ

```
JE/JZ Destination
```


*Jumps if ZeroFlag = 1*

## JNE / JNZ

```
JNE/JNZ Destination
```

*Jumps if ZeroFlag = 0*


## Call

```
Call Destination
```

## Ret
```
Ret
```

## SysCall
```
Syscall

```

It checks the value of RAX, Then calls kernal according to that

![](../../attachments/Pasted%20image%2020250517090416.png)
 RAX -> Check For Syscall
RDI, RSI, RDX, RCX R8, R9 -> is used for passing argument
![](../attachments/Pasted%20image%2020250517090527.png)

# Writing Program using Assembly

*3* Section
	1. Text section -> Codes
	2. Data Section -> Initialized Variable
	3. BSS Section -> Uninitialized Value

### write system call
write(int fd, const void *buf, size_t count)

0 -> stdin -> input
1 -> stdout -> output
2 ->stderr -> error
3 -> length

```assembly
global _start

section .text

_start:
    mov rax,1 ; write syscall
    mov rdi,1 ; output
    mov rsi,hello ; buffer-> hello
    mov rdx,11 ; size of the buffer
    syscall

section .data
      hello: db "Hello World"

```
*these are passed into argument like the image above*

```
nasm -f elf64 hh.asm -o hh.o
```

here hh.asm is the file name and hh.o is the name of output file.
*but* we need *linker*
```
ld hh.o -o hh
```

after running this
```
ld hh.o -o hh
❯ file hh
hh: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), statically linked, not stripped
❯ ./hh
Hello World[1]    109124 segmentation fault (core dumped)  ./hh
```

segmentation fault -> trying to go somewhere that does not exists
cause we did not told it to *exit*

*fixed*
```assembly
global _start

section .text

_start:
    mov rax,1 ; write syscall
    mov rdi,1 ; output
    mov rsi,hello ; buffer-> hello
    mov rdx,11 ; size of the buffer
    syscall

    mov rax,60 ;exit syscall
    mov rdi,0; status code -> 22
    syscall

section .data
      hello: db "Hello World"

```


# Taking User Input from user

First Printing whats Your Name

```Assembly
global _start

section .text

mov rax,1
mov rdi,1
mov rsi,a
mov rdx,16
syscall

mov rax,60
mov rdi,0
syscall

section .data
	a: db "Whats Your Name:"
```



## Another

