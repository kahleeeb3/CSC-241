# Day 11 Notes
> ## Op-Code and Operands
- There are 32 General Purpose registers (0-31)
- It take 5 bits to encode numbers 0-31.
    - That's why there is 5 bits for a register
    - 16 bits for an immediate value

- **So, what's the biggest number you can load?**
    - The largest 16 bit number?
        - Not quite you idiot
        - 65,535 would be the largest number we can load. (`0xFFFF shifted left 16 bits`).

- **What do "hw" bits do?**
    - We load into an "x" or "w" register
        - "w" - two 16 bit chunks
    - "hw" is how many 16 bit shifts I make. i.e. "01" is a shift by 16. `"10" shift 32. "11" shift by 48.`
    - Wouldn't shift by 32 or 48.
```armasm
movz w0, #0xFFFF // Load FFFF (0000,FFFF)
movz w0, #0xFFFF, LSL #16 // Shift by 16 bits left (FFFF, 0000)

mov w0, 0 // Move 0 into reg w0
mov w0, #3 // 60008052 // What does this mean?
```
- `0101|0010|1000|0000|0000|0000|0110|0000` is 3 in Binary.
- `5|2|8|0|0|0|6|0` in hex. This matches the `60008052` encoding we saw.

> ## Three Types of MOV
- Open PDF and Spread Sheet
- MOVZ, MOVK, MOVN.
    - **MOVZ** is the regular MOV and stores the value given in a register.
    - **MOVK** works like MOVZ, but preserves any bits already in the distination register.
    - **MOVN** works like MOVZ but with negation: after MOVZ, the entire result is NOT'd.
