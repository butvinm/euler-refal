with open('solutions/22/0022_names.txt') as f:
    names = f.read().replace('"', '').split(',')
    names.sort()
    total = sum(
        (i + 1) * sum(ord(c) - ord('A') + 1 for c in name)
        for i, name in enumerate(names)
    )
    print(total)
