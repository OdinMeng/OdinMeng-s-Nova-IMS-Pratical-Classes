"""
File with everything about characters (integrated with inventory et cetera)
"""

from random import gauss as m_gauss
from math import floor as m_floor
from inventory import Inventory

class Character:
    def __init__(self, name, house, strength, defense, intelligence, charisma, inventory_size):
        self.name = name
        self.house = house
        self._strength = strength
        self._defense = defense
        self._intelligence = intelligence
        self._charisma = charisma
        self._health = 100
        self.position = (0, 0)
        self.inventory = Inventory(inventory_size)

    def move(self, direction):
        x, y = self.position
        if direction == 'north':
            self.position = (x, y + 1)
        elif direction == 'south':
            self.position = (x, y - 1)
        elif direction == 'east':
            self.position = (x + 1, y)
        elif direction == 'west':
            self.position = (x - 1, y)

    @property
    def speak_words(self):
        return f"{self.name} says: {self.words}"

    @property
    def total_stats(self):
        return self._strength + self._intelligence + self._charisma

    @property
    def health(self):
        return self._health

    @health.setter
    def health(self, value):
        if value < 0:
            self._health = 0
        elif value > 100:
            self._health = 100
        else:
            self._health = value

    @health.deleter
    def health(self):
        del self._health

    def get_inventory(self):
        r = (self.inventory).capacity - len(self.inventory.items)
        s = f"{self.name}'s Inventory ({len(self.inventory.items)}/{self.inventory.capacity})"
        for item in self.inventory.items:
            s += f"\n\t- {item}"

        for i in range(r):
            s += f"\n\t- EMPTY SLOT"

        return s

    def use_item(self, target):
        attempt = (self.inventory).remove_item(target)
        if attempt:
            return (f"{self.name} used item {target} from his inventory.")
            

        elif not attempt:
            return (f"{self.name} could not use item {target} from his inventory.")

    def combat(self, other):
        dmg = m_floor(m_gauss(self._strength, 5))-m_floor(m_gauss(other._defense*.75, 15)) # Damage formula
        
        if dmg < 0:
            dmg = 0
        if dmg > 99:
            dmg = 99

        other.health = other.health-dmg

        return (f"{self.name} attacked {other.name} for {dmg} damage. {other.name} has {other.health} remaining.")
