#ifndef GAME_H
#define GAME_H

#include "gba.h"


typedef struct {
    int x, y; // Position
    int width, height;
    int speed; // Movement speed
    unsigned short color; // Color of the player
} PLAYER;
typedef struct {
    int x, y, width, height, speed;
    unsigned short color;
    int active;
} BULLET;

typedef struct {
    int x, y, width, height, speed, radius;
    unsigned short color;
    int active;

} ENEMY;
typedef struct {
    int x;
    int y;
} STAR;


enum { START, PLAY, PAUSE, WIN, SCOREBOARD} state;

// Function Prototypes
void updateGame();
void drawGame();
void drawStars();
void play();
void initGame();
void updatePlayer();
void updateEnemies();
void fireBullet();
void drawPlayer();
void drawEnemies();
void drawBullets();
void checkCollisions();

extern PLAYER player;
extern ENEMY enemy;
extern int score;


#endif // GAME_H
// Your game-specific declarations go here
