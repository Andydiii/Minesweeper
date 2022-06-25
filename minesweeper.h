#include <stdbool.h>

// A module with rules for the minesweeper game

// SEASHELL_READONLY

struct posn {
  int x;
  int y;
};

extern const char UNREVEALED;
extern const char REVEALED[];
extern const char FLAG;
extern const char MINE;

// in a valid board:
// * width > 0, height > 0
// * (width * height) is the length of the array board 
// * coordinate (x,y) is stored in board[(y-1) * width + x - 1]
//   the lop-left coordinate is at (1,1), bottom-right is (width,height)
// * each element of board is one of:
//   UNREVEALED, REVEALED[0..8], FLAG or MINE
// * num_mines is the length of mines,
//   each mine is at a valid and unique coordinate

struct ms_board {
  int width;
  int height;
  char *board;
  int num_mines;
  struct posn *mines;
};

// flag(b, x, y) places a FLAG on an UNREVEALED tile (x,y) or makes a
//   previously flagged tile UNREVEALED.
//   Returns true if successful (a flag was placed or removed)
//   and false if the tile (x,y) was already revealed.
// requires: *b is a valid ms_board
//           1 <= x <= b->width
//           1 <= y <= b->height
// effects: mutates board b

bool flag(struct ms_board *b, int x, int y);


// reveal(b, x, y) reveals (x,y) and replaces it with either a MINE
//   or REVEALED[z] where z is the number of mines adjacent to (x,y).
//   Returns true if successful [(x,y) was UNREVEALED and now revealed]
//   and false if the tile (x,y) was already REVEALED, a MINE or a FLAG.
//   If z is 0, it also reveals all unrevealed adjacent tiles (neighbours),
//   and (recursively) continues to do so until no more 0's are revealed.
// requires: *b is a valid ms_board
//           1 <= x <= b->width
//           1 <= y <= b->height
// effects: mutates board b


bool reveal(struct ms_board *b, int x, int y);


// game_won(b) returns true if ALL safe (mine-free) tiles are REVEALED
//   and ALL mined tiles are either UNREVEALED or FLAG.
//   Returns false otherwise.
// requires: *b is a valid ms_board


bool game_won(const struct ms_board *b);


// game_lost(b) returns true if there are any MINEs on board b.
//   Returns false otherwise.
// requires: *b is a valid ms_board

bool game_lost(const struct ms_board *b);
