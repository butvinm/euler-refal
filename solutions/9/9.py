def solve() -> int | None:
    for a in range(1, 333 + 1):
        for b in range(a + 1, 1000 - a):
            c = 1000 - b - a
            if a**2 + b**2 == c**2:
                return a * b * c

    return None


if __name__ == '__main__':
    print(solve())
