# Minesweeper

Minesweeper is a computer game dating back to the 1970s. (It no longer comes with Windows, but is still playable online in a number of places, such as [here](https://freeminesweeper.org/)). The rules can be found [here](https://freeminesweeper.org/how-to-play-minesweeper.php).

I have provided the implementation of the module in minesweeper.c and the interface in minesweeper.h. This module is responsible for the game logic. It is used to update the board when the client wants to make a move, and to determine if the game is over.

The game rules match the rules linked above, with three differences. First, if we lose it does not reveal the entire board. besides, there is only one kind of flag, no '?' flag for uncertain squares.

This module can be used to create a graphical game like the version linked above. But I was using Seashell which is provided by my university of waterloo, and only supports text interfaces though, so there is an ASCII version of minesweeper, in the game.ll program.

- About the rules
A Minesweeper board is a 2D grid of tiles. Initially all tiles are un-revealed.

The goal in Minesweeper is to reveal all tiles on the board except the ones containing mines. When you reveal a tile, you either uncover a mine (an asterisk character '*'), losing the game, or we uncover a number (a digit character '0' through '8'). This digit represents the number of nearby mines, where "nearby" means "in the 8 adjacent tiles" (tiles at the edges of the board have fewer than 8 adjacent tiles).

Winning involves making careful deductions based on the numbers revealed. It also usually involves dumb luck.

Because it's difficult to keep track of all of the mines in one's head, the game usually lets the player place a flag on a tile they are sure contains a mine. This has no effect other than preventing them from revealing it accidentally, and reminding them of the locations of mines. We will be using the character 'F' to represent a flag. Flag starts with 'F' and 'F' also looks like a flag (sort of), so it's a double win.

you can view an example game [Here](https://student.cs.uwaterloo.ca/~cs136/current/assignments/a5/example.shtml). 

- About the representation
We will represent the 2D board as an array of characters using the approach used on slide 07-47. To make things easier on human players, the interface starts counting rows and columns from 1, rather than from 0. That is, the first element in the array will correspond to row 1, column 1 (instead of row 0, column 0 like it does in the notes).

Board tiles are represented using space ' ' for an un-revealed tile, 'F' for a flag, '0' through '8' for a mine-free revealed tile, and '*' for a revealed tile that has a mine in it. These characters have been defined as constants for you. You should use the constants, not their values!

- About the game program
To make things fun, there is an interactive client that lets you play the game. This client has a limit of 16 for each dimension of the board. This is to keep the board small enough to display nicely in ASCII. 

Note: Because there is a lot of text involved in the game program, we strongly recommend against creating .expect files for use with game.ll. Create an assertion-based testing client, like the one we have provided. The interactive client is ONLY for fun. If you do not want fun, you do not have to use this file at all.

