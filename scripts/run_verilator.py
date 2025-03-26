import random

N = 4
WIDTH = 8

def rand_matrix():
    return [random.randint(1, 5) for _ in range(N)]

A = rand_matrix()
B = rand_matrix()
res = sum([a*b for a, b in zip(A, B)])

print("A:", A)
print("B:", B)
print("Expected Result (Dot Product):", res)
