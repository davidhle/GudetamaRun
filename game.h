// Game structs
typedef struct  
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int bulletTimer;
} PLAYER;

typedef struct 
{
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int index;
    int active;
} BULLET;

// External variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];

// Constants
#define BULLETCOUNT 5
#define MAPWIDTH 512

// Prototypes
void draw();
void drawPlayer();
void update();
void updatePlayer();
void initialize();
void hideSprites();