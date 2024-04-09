;comments in assembly language are denoted by a semicolon (;). They are ignored by the assembler and are only for human readability.

; Example for a flat binary.

use32       
;use32: This directive specifies that the assembly code should be assembled in 32-bit mode. In 32-bit mode, instructions and registers are 32 bits wide.

inc     eax
inc     eax  ; This is a comment.
dec     eax
inc     eax