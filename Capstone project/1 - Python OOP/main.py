from character import Character
from game import *

if __name__ == "__main__":
    print('='*15)

    Jon = Character("Jon", "A", 10, 10, 10, 10, 10)
    Danaerys = Character("Danaerys", "B", 10, 10, 10, 10, 10)
    Tyrion = Character("Tyrion", "C", 10, 10, 10, 10, 10)
    characters = [Jon, Danaerys, Tyrion]

    board = create_board(5)
    board = place_characters(board, characters)

    print_board(board)

    print('='*15)

    for character in characters:
        print(f"{character.name} is in position {character.position}")
