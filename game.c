#include "gba.h"
#include "print.h"
#include "game.h"
#include "analogSound.h"
#include <stdlib.h>
#include <stdio.h> // Include for sprintf to handle score buffer
#include <math.h> // Include for math functions like sqrt and cos
#include "startscreen.h"
#include "goldcoins.h"


#define NUM_STARS 50 // Number of stars to display
STAR stars[NUM_STARS]; // Array to hold star positions

#define COIN_WIDTH 8
#define COIN_HEIGHT 8

PLAYER player;
ENEMY enemies[5]; // Pool of 5 enemies
BULLET bullets[3]; // Pool of 3 bullets

// Monster pixel data (1 represents filled, 0 represents empty)
int coinPixels[8][8] = {
    {0, 1, 1, 1, 1, 1, 1, 0},
    {1, 1, 0, 0, 1, 0, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1},
    {1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 1, 1, 1, 1, 0, 1},
    {1, 1, 0, 1, 1, 0, 1, 1},
    {0, 1, 1, 0, 0, 1, 1, 0},
    {1, 0, 1, 1, 1, 1, 0, 1}
};


// Laser state
int laserActive = 0; // Tracks if the laser is being fired
//int score = 0; // Tracks the player's score
char scoreBuffer[20]; // Buffer to hold the score text
// score tracker
int score =0;

// Initialize the game objects (player, enemies, bullets)
void initGame() {
    DMANow(3, startscreenPal, BG_PALETTE, 256);

    // Initialize player
    player.x = 120;
    player.y = 140;
    player.width = 32;
    player.height = 32;
    player.speed = 2;
    player.color = GREEN;

    // Initialize enemies and bullets
    for (int i = 0; i < 5; i++) {
        enemies[i].active = 0; // Set all enemies as inactive initially
        enemies[i].width = COIN_WIDTH;
        enemies[i].height = COIN_HEIGHT;
        enemies[i].speed = 2 + rand() % 3;    // Random speed for variety
    }
    for (int i = 0; i < 3; i++) {
        bullets[i].active = 0; // Set all bullets as inactive
    }

    // Initialize stars
    for (int i = 0; i < NUM_STARS; i++) {
        stars[i].x = rand() % 240; // Random X position on the screen
        stars[i].y = rand() % 160; // Random Y position on the screen
    }
    // Initialize score
    score = 0;
   // sprintf(scoreBuffer, "Score: %d", score); // Initialize score text
}

void drawStars() {
    for (int i = 0; i < NUM_STARS; i++) {
        setPixel4(stars[i].x, stars[i].y, WHITE); // Draw each star as a white pixel
    }
}

// Draw the game 
void drawGame() {
    fillScreen4(BLACK);  // Clear the screen before redrawing
    drawStars();

    if (state == PLAY) {
        drawPlayer();
        drawEnemies();
        drawBullets();

        // Draw the score at the top-right corner
        drawString4(180, 1, "Score:", MAGENTA);
        drawString4(220, 1, scoreBuffer, MAGENTA); // Draw the updated score

        if (laserActive) {
            drawLaser(); // Draw the laser if active
        }
    } else if (state == WIN) {
        // Display a win message
        drawString4(90, 70, "YOU WIN!", YELLOW);
        drawString4(60, 90, "Press Start to Play Again", WHITE);
    }
}

// Update game logic: player, enemies, bullets, and collisions
void updateGame() {
    sprintf(scoreBuffer, "%d", score); // Initialize score text

   
    if (state == PLAY) { // Only update game elements in the play state
        updatePlayer();    // Update player movement and actions
        updateEnemies();   // Update enemies' positions and state
        updateBullets();   // Update bullets' positions and state
        checkCollisions(); // Check for collisions between bullets and enemies
        checkPlayerCollision(); // Check for collision between player and enemies

        // Check if the score has reached 100, transition to win state
        if (score >= 100) {
            state = WIN;
        }
    }

    waitForVBlank(); // Ensure VBlank sync before drawing
}

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.x > 0) { // Ensure player doesn't move off the left edge
            player.x -= player.speed;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.x + player.width < 240) { // Ensure player doesn't move off the right edge
            player.x += player.speed;
        }
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireBullet();
        laserActive = 1; // Activate the laser when A is pressed
        playAnalogSound(1); // Play the zap sound
    }
    if (BUTTON_HELD(BUTTON_A) == 0) { // Check if A is released
        laserActive = 0; // Deactivate the laser when A is released
    }
}


// Update the positions of the enemies
void updateEnemies() {
    for (int i = 0; i < 5; i++) {
        if (enemies[i].active) {
            enemies[i].y += enemies[i].speed;

            // Deactivate if off the screen
            if (enemies[i].y > 160) {
                enemies[i].active = 0; // Deactivate if off the screen
            }
        } else {
            // Randomly respawn enemies at various angles
            int spawnChance = rand() % 100;
            if (spawnChance < 5) { // Adjust spawn chance as per your game's pacing
                enemies[i].x = rand() % 240;  // Random X position
                enemies[i].y = 0;  // Spawn from the top
                enemies[i].active = 1; // Activate the enemy
                enemies[i].color = RED; // Adjust color as per your game's design
                enemies[i].radius = 5 + rand() % 10; // Random radius for variety
                enemies[i].speed = 2 + rand() % 3;   // Random speed for variety
            }
        }
    }
}


// Fire a bullet from the player's position
void fireBullet() {
    for (int i = 0; i < 3; i++) {
        if (!bullets[i].active) { // If a bullet is inactive, fire it
            bullets[i].x = player.x + player.width / 2;
            bullets[i].y = player.y;
            bullets[i].width = 2;
            bullets[i].height = 5;
            bullets[i].speed = 3; // Set bullet speed
            bullets[i].active = 1;
            break; // Only fire one bullet at a time
        }
    }
}

// Update the bullets' positions and handle deactivation
void updateBullets() {
    for (int i = 0; i < 3; i++) {
        if (bullets[i].active) {
            // Move the bullet upwards
            bullets[i].y -= bullets[i].speed;
            
            // Deactivate the bullet if it goes off the screen
            if (bullets[i].y < 0) {
                bullets[i].active = 0;
            }
        }
    }
}
// Draw the player on the screen
void drawPlayer() {
    drawImage4(player.x, player.y, player.width, player.height, goldcoinsBitmap); // Use the gold coins bitmap

}

// Drawing pixelated monster enemies
void drawEnemies() {
    for (int i = 0; i < 5; i++) {
        if (enemies[i].active) {
             drawPixelatedCoin(enemies[i].x, enemies[i].y, enemies[i].width, GOLD); // Use the draw function for coins

        }
    }
}

// Function to draw pixelated monsters
void drawPixelatedCoin(int x, int y, int size, unsigned short color) {
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            if (coinPixels[i][j] == 1) {
                setPixel4(x + j, y + i, color); // Draw active pixels with color
            }
        }
    }
}

// Draw the active bullets on the screen
void drawBullets() {
    for (int i = 0; i < 3; i++) {
        if (bullets[i].active) {
            drawRect4(bullets[i].x, bullets[i].y, bullets[i].width, bullets[i].height, YELLOW);
        }
    }
}

// Draw the laser when active
void drawLaser() {
    drawRect4(player.x + player.width / 2 - 1, player.y - 5, 2, 5, RED); // Draw a red laser above the player
}

// Simple collision detection between two rectangles (AABB collision)
int collision(BULLET bullet, ENEMY enemy) {
    return (bullet.x < enemy.x + enemy.radius &&
            bullet.x + bullet.width > enemy.x - enemy.radius &&
            bullet.y < enemy.y + enemy.radius &&
            bullet.y + bullet.height > enemy.y - enemy.radius);
}

// Check for bullet-enemy collisions and update score
void checkCollisions() {
    for (int i = 0; i < 5; i++) {
        if (enemies[i].active) {
            for (int j = 0; j < 3; j++) {
                if (bullets[j].active && collision(bullets[j], enemies[i])) {
                    enemies[i].active = 0; // Deactivate enemy
                    bullets[j].active = 0; // Deactivate bullet
                    score += 5; // Increase score
                    sprintf(scoreBuffer, "Score:%d", score); // Update score text
                }
            }
        }
    }
}

// Simple collision detection between player and circular enemy
int collisionPlayerAsteroid(PLAYER player, ENEMY asteroid) {
    // Calculate distance between player center and asteroid center
    int dx = asteroid.x - (player.x + player.width / 2);
    int dy = asteroid.y - (player.y + player.height / 2);
    int distance = sqrt(dx * dx + dy * dy);

    // Check if the distance is less than the sum of radii for collision
    return (distance < asteroid.radius + player.width / 2);
}
// check collision with gold
void checkPlayerCollision() {
    for (int i = 0; i < 5; i++) { // Loop through the enemies
        if (enemies[i].active && collisionPlayerAsteroid(player, enemies[i])) { // Check for collision
            enemies[i].active = 0; 
            playAnalogSound(13);// Deactivate enemy on collision
            score += 10; // Increase score

            // Check if score reaches 100
            if (score >= 100) {
                state = WIN; // Transition to win state
            }

            // Update score buffer
            sprintf(scoreBuffer, "Score: %d", score);
        }
    }
}