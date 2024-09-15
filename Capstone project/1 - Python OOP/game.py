# Starting to experiment with parameters typing
import random

def create_board(size: int)->list:
    L = []
    for i in range(size):
        LL = []
        for j in range(size):
            LL.append(' ')
        L.append(LL)

    return L

def print_board(board: list)->None:
    for row in board:
        print("|", end="")
        for item in row:
            print(f"{item}|", end="")
        print("")

def place_characters(board: list, characters: list)->list:
    for character in characters:
        # 1. generate position  # 2. ensure it's not occupied (so not "occupied" with an empty space) # 3. reroll if necesasary # 4. place
        i = random.randint(0, len(board)-1)
        j = random.randint(0, len(board)-1)

        while board[i][j] != ' ':
            i = random.randint(0, len(board)-1)
            j = random.randint(0, len(board)-1)

        board[i][j] = character.name[0]
        character.position = (i,j)

    return board



    
