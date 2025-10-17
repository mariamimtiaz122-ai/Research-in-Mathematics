# data_model.py
# Simple mathematical model demonstration by Mariam Imtiaz (MPhil & MSc Gold Medalist)

import numpy as np
import matplotlib.pyplot as plt

def sigmoid(x):
    """Basic mathematical function used in machine learning."""
    return 1 / (1 + np.exp(-x))

x = np.linspace(-10, 10, 100)
y = sigmoid(x)

plt.plot(x, y)
plt.title("Sigmoid Function - Mathematical Modeling Example")
plt.xlabel("x")
plt.ylabel("sigmoid(x)")
plt.grid(True)
plt.show()
