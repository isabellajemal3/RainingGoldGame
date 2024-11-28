# 1 "gba.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "gba.c"
# 1 "gba.h" 1




typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;






extern volatile unsigned short* videoBuffer;
# 45 "gba.h"
void waitForVBlank();
# 61 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile void* src;
    volatile void* dest;
    unsigned int ctrl;
} DMAChannel;
# 95 "gba.h"
void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl);
# 2 "gba.c" 2


unsigned volatile short* videoBuffer = (unsigned short*) 0x06000000;
# 13 "gba.c"
void waitForVBlank() {
    while ((*(volatile unsigned short*) 0x04000006) >= 160);
    while ((*(volatile unsigned short*) 0x04000006) < 160);
}



void DMANow(int channel, volatile void* src, volatile void* dest, unsigned int ctrl) {
    ((DMAChannel*)0x040000B0)[channel].ctrl = 0;
    ((DMAChannel*)0x040000B0)[channel].src = src;
    ((DMAChannel*)0x040000B0)[channel].dest = dest;
    ((DMAChannel*)0x040000B0)[channel].ctrl = ctrl | (1 << 31);
}
