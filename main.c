#include "gba.h"
#include "mode4.h"
#include "game.h"  
#include "analogSound.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>  // Include for randomization
#include "startscreen.h"
#include "goldcoins.h"


// Color definitions
#define OFFWHITE 0xFFFF // GBA uses 16-bit color representation (RGB555)
#define BUFFER_SIZE 32   // Buffer size for score display
#define RED 0xF800       // Define the color red for end state
#define BLUE 0x001F      // Define the color blue for pause state

// Game states
//enum { START, PLAY, PAUSE, WIN } state;

// Button variables
unsigned short buttons;
unsigned short oldButtons;

int topScore = 0; // Initialize top score


// Score variables
char scoreBuffer[41];

// Function prototypes
void initialize();
void goToStart();
void start();
void goToPlay();
void play();
void goToPause();
void pause();
void goToWin();
void win();
void updateGame();  // This function should handle game updates

// Main function
int main() {
    // Initialize the game
    initialize();

    while (1) {
        // Update button variables
        oldButtons = buttons;
        buttons = REG_BUTTONS;

    // State machine
    switch (state) {
        case START:
            goToStart();
            start();
            break;
        case PLAY:
            play();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case SCOREBOARD: // Add this case to handle scoreboard state
            updateScoreboard();
            break;
    } 
    }
}

// Initialization function
void initialize() {
    REG_DISPCTL = MODE(4) | BG2_ENABLE | DISP_BACKBUFFER; // Set display mode

    initSound();

    buttons = REG_BUTTONS;
    oldButtons = 0;

    srand(time(NULL)); // Seed random number generator
    score = 0;         // Initialize the score to zero
    sprintf(scoreBuffer, "%d", score); // Initialize score buffer
    goToStart();
}

// Go to start state
// Go to start state
void goToStart() {
    DMANow(3, startscreenPal, BG_PALETTE, 256);
    drawFullscreenImage4(startscreenBitmap); // Copy the bitmap to VRAM

    waitForVBlank();
    drawString4(80, 72, "Raining Gold", WHITE); // Title centered in the middle
    drawString4(70, 100, "Press Start to Play", WHITE); // Instructions centered below

    // Display top score on the start screen
    char scoreBuffer[20];
    //sprintf(scoreBuffer, "Top Score: %d", topScore);
    drawString4(80, 120, scoreBuffer, WHITE); // Show top score
    flipPages();

    state = START;
}

// Start state handler
void start() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPlay();
        initGame(); // Initialize game elements
    }  else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToScoreboard(); // Go to the scoreboard
    }
}

// Go to play state
void goToPlay() {
    DMANow(3, startscreenPal, BG_PALETTE, 256);
    fillScreen4(OFFWHITE); // Clear screen for gameplay
    drawString4(220, 1, scoreBuffer, WHITE); // Draw initial score
    waitForVBlank();
    flipPages();

    state = PLAY;
}

// Play state handler
void play() {
    updateGame(); // Update game elements like player, enemies, bullets, etc.
    drawGame();

    // Update score display
    drawString4(180, 1, "Score:", OFFWHITE);
    sprintf(scoreBuffer, "%d", score); // Convert score to string
    drawString4(220, 1, scoreBuffer, WHITE); // Draw updated score

    // Check if player collected 100 points and win
    if (score >= 100) {
        goToWin();
    }

    // Check for firing condition
    if (BUTTON_PRESSED(BUTTON_A)) {
        fireBullet(); // Assume this function handles firing logic
        playAnalogSound(1); // Play sound for firing a bullet
    }

    waitForVBlank();
    flipPages();

    // Check for pause condition
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPause();
        playAnalogSound(17);
    }

    // If score >= 100, trigger win condition
    if (score >= 100) {
        goToWin();
    }
}



// Go to pause state
void goToPause() {
    DMANow(3, startscreenPal, BG_PALETTE, 256);
    fillScreen4(OFFWHITE);
    drawString4(80, 100, "Paused", BLUE);
    drawString4(60, 120, "Press Select to Resume", BLUE);
    drawString4(60, 130, "Press Start for Scoreboard", BLUE); // Option to go to scoreboard
    waitForVBlank();
    flipPages(); // Wait for vertical blank
    state = PAUSE;
}

// Pause state handler
void pause() {
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToPlay();
    } else if (BUTTON_PRESSED(BUTTON_START)) {
         goToScoreboard(); 

         state = SCOREBOARD;
    }
}

// Go to win state
// Go to win state
void goToWin() {
    DMANow(3, startscreenPal, BG_PALETTE, 256);
    fillScreen4(OFFWHITE);
    
    // Check and update top score
    if (score > topScore) {
        topScore = score; // Update top score
    }

    drawString4(40, 100, "Congrats, you collected 100 gold!", BLUE);
    drawString4(80, 120, "Press Start to Play Again", BLUE);
    playAnalogSound(16);
    waitForVBlank();
    flipPages();

    state = WIN;
}


// Win state handler
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart(); // Restart the game
    }
}

// Go to scoreboard state
// Go to scoreboard state
void goToScoreboard() {
    // Check and update the top score
    if (score > topScore) {
        topScore = score; // Update the top score if current score is higher
    }

    fillScreen4(OFFWHITE); // Clear the screen
    drawString4(80, 50, "Top Scores", BLUE);

    // Display the top score
    char buffer[32];
    sprintf(buffer, "Top Score: %d", topScore); // Display updated top score
    drawString4(80, 80, buffer, BLUE);

    drawString4(80, 120, "Press Start to Return", BLUE);
    waitForVBlank();
    flipPages();

    state = SCOREBOARD; // Set state to scoreboard
}

//Update scoreboard state
void updateScoreboard() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart(); // Return to start screen
        state = START;
    }
}

