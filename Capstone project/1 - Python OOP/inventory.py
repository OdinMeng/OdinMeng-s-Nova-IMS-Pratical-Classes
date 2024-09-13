"""
Inventory System
"""
class Inventory:
    def __init__(self, capacity=0):
        self.capacity = capacity
        self.items = []

    def add_item(self, item):
        if len(self.items)+1 > self.capacity:
            return False

        else:
            (self.items).append(item)
            return True

    def remove_item(self, item_target):
        i = 0
        found = False
        for item in self.items:
            if item == item_target:
                found = True
                break

            i += 1

        if not found:
            return False

        if found:
            self.items.pop(i)
            return True

    def get_total_value(self):
        return f"{len(self.items)} out of {self.capacity}"