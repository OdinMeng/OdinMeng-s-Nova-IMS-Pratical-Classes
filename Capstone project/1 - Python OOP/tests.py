from sys import argv # Command line arguments, to do invididual (or general) testing

help_text = """
Command syntax: python ./tests.py [arg]
[arg] options
    -h : help (prints this string)
    -c : tests character.py
    -i : tests inventory.py
    -ci : tests character.py integrated with inventory.py
    -b : tests combat.py
    omitted : tests all of the above

NOTE: game.py is not tested
"""

def help_user():
    print(help_text)
    pass #TODO

def test1()->int:
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
    pass #TODO

def test4()->int:
    pass #TODO

if len(argv) > 1:
    print("Running tests on inventory.py ...")
    if argv[1] == "-h":
        help_user()
    if argv[1] == "-i":
        score = test2()
        print(f"{'='*30}\nInventory test result: {score} out of 13")

elif len(argv) == 1:
    score_1 = test1()
    score_2 = test2()
    score_3 = test3()
    score_4 = test4()

    print(f"Score: {score_1+score_2+score_3+score_4} out of ... #TODO")

