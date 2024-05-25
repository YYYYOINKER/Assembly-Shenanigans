# Assembly-Shenanigans

## About
This repository, "Assembly-Shenanigans", is where I document my journey learning x86 assembly language. The process is challenging but fulfilling, and each line of code written is a step toward deeper understanding.

## Motivation
Learning assembly is like peering under the hood of your computer. It's about understanding how things really work at the most fundamental level. This journey is not just about learning to code in assembly but about gaining insights that are not visible with higher-level languages.

## Running the Code
To run the assembly code:
1. **Assemble the code**:
   ```bash
   nasm -f elf32 hello.asm -o hello.o
   ld -m elf_i386 -s -o hello hello.o
2. **Run the code**
   ```bash
   ./hello

## What's Inside
This repository will contain:
- **Examples**: Simple programs written in x86 assembly that illustrate basic concepts.
- **Notes**: My personal notes and insights gained through the process.
- **Resources**: Links to tutorials, books, and other resources that I find helpful.

## Learning Resources
Here are some of the resources I've found useful on my journey:
- [TutorialsPoint - Assembly Programming](https://www.tutorialspoint.com/assembly_programming/)
- [NASM Documentation](https://www.nasm.us/docs.php)
- [YouTube Playlist - Olive Stem Assembly Tutorials](https://www.youtube.com/watch?v=yBO-EJoVDo0&list=PL2EF13wm-hWCoj6tUBGUmrkJmH1972dBB&ab_channel=OliveStem)

## Author
- [YYYYOINKER](https://github.com/YYYYOINKER) - Feel free to follow my progress!

## Acknowledgements
Thanks to all the community contributors and the numerous tutorial creators who have made their knowledge available. Special thanks to the folks at Stack Overflow, without whom troubleshooting would be a nightmare.

---

