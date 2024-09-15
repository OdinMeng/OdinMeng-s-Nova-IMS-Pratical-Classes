from sys import argv # Command line arguments, to do invididual (or general) testing

help_text = """
Command syntax: python ./tests.py [arg]
[arg] options
    -h : help (prints this string)
    -c : tests character.py
    -i : tests inventory.py
    -ci : tests character.py integrated with inventory.py
    -b : tests combat.py
    -all : tests all
    omitted : same as -h

NOTE: game.py is not tested, it's in main.py
"""

def help_user():
    print(help_text)

def test1()->int:
    from character import Character #not gonna do this tbh
    pass #TODO

def test2()->int:
    score = 0 
    from inventory import Inventory
    sample_inventory = Inventory(10)

    for i in range(10):
        try:
            sample_inventory.add_item(i)
        except:
            print("Test sample_inventory.add_item(...) failed")
        else:
            score+=1

    attempt = sample_inventory.add_item(99)
    if attempt:
        print("Test sample_inventory.add_item(...) failed")
    else:
        score += 1


    attempt = sample_inventory.remove_item(2)
    if attempt:
        score +=1
    else: 
        print("Test sample_inventory.remove_item(...) failed")
    
    attempt = sample_inventory.remove_item(50)
    if not attempt:
        pass
    else:
        print("Test sample_inventory.remove_item(...) failed.")

    s = sample_inventory.get_total_value()
    if s != "9 out of 10":
        print("Test sample_inventory.get_total_value() failed.")
    else:
        score+=1
    
    return score

def test3()->int:
    from inventory import Inventory
    from character import Character
    brugo = Character("brugo","ferrari",10,20,30,8)
    brugo.inventory.add_item("Sword")
    brugo.inventory.add_item("Potion")
    print(brugo.get_inventory())
    print(brugo.use_item("Sword"))
    print(brugo.get_inventory())

def test4()->int:
    from character import Character

    Jon = Character("Jon Snow", "A", 20, 15, 10, 10, 10)
    Ramsay = Character("Ramsay Bolton", "B", 10, 25, 10, 10, 10)

    for i in range(10):
        print(f"{'='*10} TURN {i} {'='*10}")
        print(Jon.combat(Ramsay))

        if Ramsay.health <= 0:
            print("Ramsay perished in battle!")
            break

        print(Ramsay.combat(Jon))
        if Jon.health <= 0:
            print("Jon perished in battle!")
            break

if len(argv) > 1:
    print("Running tests on inventory.py ...")
    if argv[1] == "-h":
        help_user()
    if argv[1] == "-i":
        score = test2()
        print(f"{'='*30}\nInventory test result: {score} out of 13")
    if argv[1] == "-c":
        test1()
    if argv[1] == "-ci":
        test3()
    if argv[1] == "-b":
        test4()
    
    if argv[1] == "-all":
        test1()
        score = test2()
        print(f"{'='*30}\nInventory test result: {score} out of 13")
        test3()
        test4()

elif len(argv) == 1:
    
    help_user()