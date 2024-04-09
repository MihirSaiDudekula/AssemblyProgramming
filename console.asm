; Example for a very basic fasm program. (Console based).

format PE console
; This line tells the assembler what kind of program we're creating.
;"PE" stands for Portable Executable. It's a file format used for executable files (programs) in Windows.
;This part tells the assembler that our program will run in a console window. A console window is a text-based interface where you can type commands and see text output

entry start
 ; This directive specifies the entry point of the program. Here, it indicates that the start label is the entry point where program execution will begin.

include 'win32a.inc' 
;This directive includes an external file named win32a.inc, which contains definitions and macros for Win32 API functions and constants. It's commonly used for Windows-specific assembly programming.

; ===============================================
section '.text' code readable executable
;This directive defines a section named .text, which contains executable code that is readable and executable. This section typically contains the actual program instructions.

start:
    ; Your program begins here:
    inc     eax
    inc     eax
    dec     eax
    inc     eax

    ; Exit the process:
	push	0
	call	[ExitProcess]
    ;These instructions prepare the arguments for and call the ExitProcess function, which is part of the kernel32.dll library. push 0 pushes the argument (exit code) onto the stack, and call [ExitProcess] calls the ExitProcess function to terminate the program.

; ====================================
; Imports section:

section '.idata' import data readable
;This directive defines a section named .idata, which contains import data. It's used for importing external functions from libraries.

library kernel,'kernel32.dll'
;library kernel,'kernel32.dll': This directive specifies the library (kernel32.dll) from which functions are being imported.
 
import  kernel,\
        ExitProcess,'ExitProcess'
;specifies the functions being imported from the kernel32.dll library. Specifically, it imports the ExitProcess function from kernel32.dll, which is used for terminating the process.