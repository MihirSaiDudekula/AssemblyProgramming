#  x86 architecture

In x86 processors, a byte is the fundamental unit of information, consisting of 8 consecutive bits. Each bit can be either 0 or 1, providing a total of 256 (2^8) possible combinations. 


Let's say we have a byte of data, which is comprised of 8 bits:
```
01011010
```

Each bit represents a binary value (0 or 1), and when combined, they represent a specific pattern or value. In this case, the binary value of the byte above is equivalent to 90 in decimal notation.

In x86 processors, bytes are commonly represented using hexadecimal notation. Hexadecimal is a base-16 numbering system that uses 16 symbols (0-9 and A-F) to represent values. Each hexadecimal digit represents 4 bits, which is half of a byte, referred to as a "nibble.

So, the byte `01011010` in hexadecimal notation would be represented as:
```
5A
```
- The first four bits `0101` corresponds to the hexadecimal digit `5`.
- The last four bits `1010` corresponds to the hexadecimal digit `A`.

Each pair of hexadecimal digits represents one byte of data. So, `5A` represents the byte in hexadecimal notation.

# instructions 
are the fundamental building blocks that represent simple tasks for the processor to perform. These tasks could include arithmetic operations like addition and subtraction, moving data from one location to another, comparing values, branching based on conditions, and many others.

Here's a brief explanation with examples:

1. **Addition Instruction**:
   - Example: `ADD`
   - This instruction adds two operands together.
   - The numeric representation (opcode) for the `ADD` instruction might be something like `01`.
   - For instance, `ADD AX, BX` adds the contents of register `AX` to the contents of register `BX`.

Each instruction is encoded as one or more bytes.

 The processor can only understand the numeric representation (opcode) of the instructions, but there are also textual representations for humans to understand.
  These textual representations make it easier for programmers to write and understand assembly language code. 

  However, eventually, programmers might become familiar with some of the numeric representations of the instructions as well, especially when dealing with performance optimization or debugging at a low level.

# code for registers

In the x86 architecture, registers like `eax`, `ax`, `ah`, and `al` are used to store data and perform operations. Here's a detailed explanation, along with a diagram:

**Registers in x86:**
- `eax`: This is a 32-bit register, meaning it can hold 32 bits of data.
- `ax`: This is a 16-bit register. It represents the lower 16 bits of `eax`.(it is a subset of eax, storing the lower 16 bit half)
- `ah`: This is the high (high, so ah) 8 bits of `ax`, corresponding to bits 8 to 15.
- `al`: This is the low (low, so al) 8 bits of `ax`, corresponding to bits 0 to 7.

**Explanation:**
- `ax` is essentially a subset of `eax`, containing the lowest 16 bits of `eax`.
- `al` and `ah` represent even smaller subsets of `ax`, focusing on the lower and higher 8 bits, respectively.
- The naming convention is quite intuitive: `h` stands for high, and `l` stands for low.

**Example:**
Let's consider the example where `eax` contains the hexadecimal number `0xABCD1234`.

- `eax`: 0xABCD1234 (32 bits)
- `ax`: 0x1234 (16 bits) - This represents the lowest 16 bits of `eax`.
- `ah`: 0x12 (8 bits) - This represents the high 8 bits of `ax`.
- `al`: 0x34 (8 bits) - This represents the low 8 bits of `ax`.


# assembler

  An Assembler is a type of computer program that takes assembly language code, which is written in a human-readable textual form (mnemonics and operands), and converts it into machine code, which consists of the numeric representations (opcodes) of instructions that the processor can understand.

Here's how it works:

Input: The input to the assembler is the assembly language code written by the programmer. This code is typically stored in a file with a .asm extension.

Processing: The assembler reads the assembly language instructions line by line, translating each mnemonic (such as MOV, ADD, SUB, etc.) and its associated operands into the corresponding machine code instructions.

Output: The output of the assembler is a binary file, often called an object file, containing the machine code instructions in a format that the processor can execute. This binary file can then be linked with other object files and libraries to create an executable program.


# MOV Instruction

- The MOV instruction allows the transfer of data from one location to another.
- Syntax: `MOV destination, source`
- Data is copied from the source operand to the destination operand.

**Examples:**

1. `mov eax,8CBh`
   - Stores the hexadecimal number `0x8CB` inside the 32-bit register `eax`. (h indicates its a hexadecimal number)

2. `mov ecx,edx`
   - Copies the value stored in the `edx` register to the `ecx` register (32-bit copy).

3. `mov si,cx`
   - Copies the value stored in the `cx` register to the `si` register (16-bit copy).

**Invalid Examples:**

1. `mov 13h,ecx`
   - It's not possible to assign the value of the `ecx` register to the memory address `13h`.

2. `mov ecx,dh`
   - Error: `ecx` is a 32-bit register, but `dh` is an 8-bit register. Sizes don't match for direct copy.

### ADD Instruction:

- **Description**: 
  - The `ADD` instruction allows adding numbers together.
  - Syntax: `ADD destination, source`
  - Effect: `destination` ← `destination` + `source`
  - The result wraps around if it's larger than the size of the arguments.

- **Examples**:
  - `ADD EAX, EDX`:
    - Adds the contents of `EAX` and `EDX`.
    - Stores the result in `EAX`. (`EAX` ← `EAX` + `EDX`).
  - `ADD ESI, 11b`:
    - Adds the number `11b` (which is 3 in decimal) to `ESI`.
    - Stores the result in `ESI`. (`ESI` ← `ESI` + 3).
  - `ADD DX, SI`:
    - Adds the contents of `SI` to `DX`.
    - Stores the result in `DX`. (`DX` ← `DX` + `SI`).
    - Note: This is a 16-bit addition.
  - **Invalid Example**: `ADD 532h, ECX`
    - `532h` cannot be the destination of the addition operation. (Where will the result be stored?)
  - **Invalid Example**: `ADD BX, EAX`
    - `BX` is of size 16-bit, but `EAX` is of size 32-bit. Sizes don’t match.

- **Note**: 
  - The `ADD` instruction operates directly on the contents of the specified registers or memory locations.
  - It's important to ensure that the sizes of the operands match, and the destination can accommodate the result of the addition.

  subtraction is similar

  