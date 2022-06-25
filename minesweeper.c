#include "minesweeper.h"
#include <assert.h>

//////////////////////////////////////
const char UNREVEALED = ' ' ;
const char REVEALED[9] = "012345678";
const char FLAG = 'F';
const char MINE = '*';
//////////////////////////////////////

// flag(b, x, y) places a FLAG on an UNREVEALED tile (x,y) or makes a
//   previously flagged tile UNREVEALED.
//   Returns true if successful (a flag was placed or removed)
//   and false if the tile (x,y) was already revealed.
// requires: *b is a valid ms_board
//           1 <= x <= b->width
//           1 <= y <= b->height
// effects: mutates board b
bool flag(struct ms_board *b, int x, int y) {
  assert(b);
  assert(x >= 1 && x <= b->width);
  assert(y >= 1 && y <= b->height);
  int width = b->width;
  if (b->board[(y - 1) * width + x - 1] == UNREVEALED) {
    b->board[(y - 1) * width + x - 1] = FLAG;
    return true;
  }
  else if (b->board[(y - 1) * width + x - 1] == FLAG) {
    b->board[(y - 1) * width + x - 1] = UNREVEALED;
    return true;
  }
  else {
    return false;
  }
}

int find_mines(struct ms_board *b, int x, int y) {
  assert(x >= 1 && x <= b->width);
  assert(y >= 1 && y <= b->height);   
  assert(b);
  int number_mines = 0;
  for (int pos = 0; pos < b->num_mines; ++pos) {
    if ((b->mines[pos].x >= x - 1) && (b->mines[pos].x <= x + 1)
        && (b->mines[pos].y >= y - 1) && (b->mines[pos].y <= y + 1)) {
      ++number_mines;
    }
  }
  return number_mines;
}

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
bool reveal(struct ms_board *b, int x, int y) {
  assert(b);
  assert(x >= 1 && x <= b->width);
  assert(y >= 1 && y <= b->height);
  int num_mines = find_mines(b, x, y);
  int pos = (y - 1) * b->width + x - 1;
  if (num_mines == 0) {
    for (int i = x - 1; i <= x + 1; ++i) {
      for (int j = y - 1; j <= y + 1; ++j) {
        pos = (j - 1) * b->width + i - 1;
        if ((i >= 1 && i <= b->width)
            && (j >= 1 && j <= b->height)) {
          if (i == x && j == y) {
            b->board[pos] = REVEALED[num_mines];
            return true;   
          }
          else if (b->board[pos] == UNREVEALED) {
            b->board[pos] = REVEALED[num_mines];
            return true;   
          }
          else {
            return false;
          }
        }
      }
    }
  }
  if (b->board[pos] == UNREVEALED) {
    b->board[pos] = REVEALED[num_mines];
    return true;
  }
  else {
    return false;
  }
}

// game_won(b) returns true if ALL safe (mine-free) tiles are REVEALED
//   and ALL mined tiles are either UNREVEALED or FLAG.
//   Returns false otherwise.
// requires: *b is a valid ms_board

bool game_won(const struct ms_board *b) {
  assert(b);
  int len = b->width * b->height;
  int num_revealed = 0;
  for (int pos = 0; pos < len; ++pos) {
    if ((b->board[pos] >= REVEALED[0]) 
        && (b->board[pos] <= REVEALED[8])) {
      ++num_revealed;
    }
  }
  if (b->num_mines == len - num_revealed) {
    return true;
  }
  else {
    return false;
  }
}

// game_lost(b) returns true if there are any MINEs on board b.
//   Returns false otherwise.
// requires: *b is a valid ms_board
bool game_lost(const struct ms_board *b) {
  int len = b->width * b->height;
  for (int pos = 0; pos < len; ++pos) {
    if (b->board[pos] == MINE) {
      return true;
    }
  }
  return false;
}

