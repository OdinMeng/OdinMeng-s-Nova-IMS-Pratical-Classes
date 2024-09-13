# Result of Class 1
Result of the *class 1 notebook* of *Capstone Project*. The main result is a *"mix"* derived from the exercises which will be described later on. Each exercise is *"solved"* with its own individual `.py` file.

---

**Exercise 1: Enhancing the Character Class**

1. **Add an attribute for attack strength:**
    - Modify the `__init__` method to include `strength`, `intelligence`, `charisma` attributes.

2. **Create an `speak_words` method:**
    - Define a method called `speak_words` that takes zero arguments.
    - Print a message indicating the name of the character and the house hords.
3. **Implement a `total_stats` method:**
    - Define a method called `total_stats` that takes zero arguments.
    - The method should return the total sum of all character stats.

---

**Exercise 2: Managing Character Healt**

1. **Add a `get_health` method:**
    - Define a method called `get_health` that takes no arguments.
    - The method should return the current health of the character.

2. **Create a `change_health` method:**
    - Define a method called `change_health` that takes one argument, `value`.
    - The method should increase or decrease the character's health by the given `value`.
    - Ensure that the health does not go below 0 or above 100.
    - Otherwise set the current health to `value`.

---

**Exercise 3: Add an inventory system**

1. **Implement an `Inventory` class and integrate it with the `Character` class:**
    - `Inventory` should have methods to add, remove items and get the total_value
    - Add a property to `Character` that returns the total value of items in the inventory.
    - Implement a method in `Character` to use an item from the inventory.

---

**Exercise 4: Implement a combat system**

1. **Create a `combat()` function that simulates combat between two characters:**
    - Add an attribute defense to `Character` class.
    - Calculate damage based on the attacker's strength and the defender's defense.
    - Update health values accordingly.
    - Return a string describing the outcome of the combat

**NOTE.** There were no further instructions on damage calculation, so I did as following.

**Combat system idea.** Let *s* and *d* be respectively the strength and defense of two players. Suppose that player with strength *s* attacks the one with defense *d*. Then let *DMG*, e.g. the damage dealt, be calculated with the random formula:
$$\mathbf{DMG} = ⌊ \mathcal{N}(\mu=s, \sigma = 5) ⌋ - ⌊ \mathcal{N}(\mu=d(0.75), \sigma = 15) ⌋ $$

Note that $\mathcal{N}(\mu, \sigma)$ denotes the *gaussian distribution* with mean $\mu$ and standard deviation $\sigma$.

Moreover, we have the following conditioning:
$$\mathbf{DMG}_{\text{final} } = \left\{ \begin{align*}&0, \mathbf{DMG} <0 \\ &\mathbf{DMG},\mathbf{DMG} \in [0, 100) \\ &99, \mathbf{DMG} \geq 100 \end{align*}\right.$$

---

**Exercise 5: Implement a Game Board and Character Placement System**

1. **Implement the create_board(size) function:**
    - Create and return a 2D list representing the game board.
    - The board should be size x size and filled with empty spaces (' ').

2. **Implement the print_board(board) function:**
    - Display the game board in a readable format.
    - Each cell should be separated by '|' and each row should be on a new line.

3. **Implement the place_characters(board, characters) function:**
    - Randomly (use import random) place each character from the characters list on an empty space on the board.
    - Update each character's position attribute with its new position (x, y).
    - Ensure characters don't overlap on the board.

4. **Complete the main() function:**
    - Create a game board of size 5x5 using create_board().
    - Place the pre-defined characters (Jon, Daenerys, Tyrion) on the board using place_characters().
    - Print the board using print_board().
    - Print each character's name and position.