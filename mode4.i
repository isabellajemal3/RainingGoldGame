# 1 "mode4.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "mode4.c"
# 1 "mode4.h" 1



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
# 42 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);


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
# 5 "mode4.h" 2




void flipPages();
void setPixel4(int x, int y, u8 colorIndex);
void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex);
void fillScreen4(volatile u8 colorIndex);
void drawImage4(int x, int y, int width, int height, const u16* image);
void drawFullscreenImage4(const u16* image);

void drawChar4(int x, int y, char ch, u8 colorIndex);
void drawString4(int x, int y, char* str, u8 colorIndex);
# 2 "mode4.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 3 "mode4.c" 2


void setPixel4(int x, int y, u8 colorIndex) {
    volatile unsigned short pixelData = videoBuffer[((y) * (240) + (x)) / 2];
    if (x & 1) {
        pixelData &= 0x00FF;
        pixelData |= colorIndex << 8;
    } else {
        pixelData &= 0xFF00;
        pixelData |= colorIndex;
    }
    videoBuffer[((y) * (240) + (x)) / 2] = pixelData;
}


void drawRect4(int x, int y, int width, int height, volatile u8 colorIndex) {

    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);

    for (int r = 0; r < height; r++) {

        if (width == 1) {
            setPixel4(x, y + r, colorIndex);
        } else if (width == 2) {
            setPixel4(x, y + r, colorIndex);
            setPixel4(x + 1, y + r, colorIndex);
        } else if ((x & 1) && (width & 1)) {
            setPixel4(x, y + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x + 1)) / 2], (2 << 23) | (width - 1) / 2);
        } else if (width & 1) {
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x)) / 2], (2 << 23) | (width - 1) / 2);
            setPixel4(x + width - 1, y + r, colorIndex);
        } else if (x & 1) {
            setPixel4(x, y + r, colorIndex);
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x + 1)) / 2], (2 << 23) | (width - 2) / 2);
            setPixel4(x + width - 1, y + r, colorIndex);
        } else {
            DMANow(3, &pixelData, &videoBuffer[((y + r) * (240) + (x)) / 2], (2 << 23) | width / 2);
        }
    }
}


void fillScreen4(volatile u8 colorIndex) {
    volatile unsigned short pixelData = colorIndex | (colorIndex << 8);
    DMANow(3, &pixelData, videoBuffer, (2 << 23) | (240 * 160) / 2);
}


void drawImage4(int x, int y, int width, int height, const u16* image) {
    for (int i = 0; i < height; i++) {
        DMANow(3, &image[((i) * (width / 2) + (0))], &videoBuffer[((y + i) * (240) + (x)) / 2], width / 2);
    }
}


void drawFullscreenImage4(const u16* image) {
    DMANow(3, image, videoBuffer, 240 * 160 / 2);
}


void drawChar4(int x, int y, char ch, u8 colorIndex) {
    for (int c = 0; c < 6; c++) {
        for (int r = 0; r < 8; r++) {
            if (fontdata_6x8[(48 * ch + c + 6 * r)]) setPixel4(x + c, y + r, colorIndex);
        }
    }
}


void drawString4(int x, int y, char* str, u8 colorIndex) {
    while (*str) {
        drawChar4(x, y, *str, colorIndex);
        str++;
        x += 6;
    }
}


void flipPages() {
    if ((*(volatile unsigned short*) 0x04000000) & (1 << 4)) {
        videoBuffer = ((unsigned short*) 0x0600A000);
    } else {
        videoBuffer = ((unsigned short*) 0x06000000);
    }
    (*(volatile unsigned short*) 0x04000000) ^= (1 << 4);
}
