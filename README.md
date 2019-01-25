# SOS
Your computer will probably be yelling SOS once this OS starts up

## What the heck is this?
I was bored and decided that I wanted to try and write my own operating system. So that's basically what this is.
## Should I use it?
No. you really shouldnt. 
I wrote this for kicks and for experience, it shouldnt be actually used on anyones computer, maybe in a VM, but thats it. 
If youre new to this type of stuff and are interested in how operating systems work, you could take a look at the code! (At least when it's finished). I tried to make it as readable as possible and I commented the living hell out of it.

## Design and stuff
The OS has two components; kernelspace and userspace.
The kernel contains two parts, the high kernel and the low kernel. The low kernel simply provies an abstraction layer for the hardware. The high kernel depends on the low kernel for hardware interaction.
For each platform that is supported, a new low kernel must be written, properly providing hardware abstraction for the new platform.
The usermode has stuff that I havent even planned out yet.

## Folders


### src/kernel/arch/ 
The low kernel abstraction layers

#### src/kernel/arch/x86/ 
Abstraction layer for the x86 architecture
