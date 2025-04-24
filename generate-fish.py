from itertools import permutations

allfishes = permutations(["women", "want", "me", "fish", "fear", "me"])
uniquefishes = set(allfishes)

with open(r'./fishlines.txt', 'w') as file:
    for fish in uniquefishes:
        file.write(" ".join(fish) + "\n")