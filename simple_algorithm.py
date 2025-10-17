"""
Example algorithm to demonstrate computational reasoning.
"""

def factorial(n):
    """Compute factorial using recursion."""
    if n == 0 or n == 1:
        return 1
    else:
        return n * factorial(n-1)

for i in range(1, 6):
    print(f"Factorial of {i} = {factorial(i)}")
