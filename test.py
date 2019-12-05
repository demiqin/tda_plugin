import numpy as np
import matplotlib.pyplot as plt
import cechmate as cm
from persim import plot_diagrams
import tadasets

# Initialize a noisy circle
X = tadasets.dsphere(n=100, d=1, r=1, noise=0.2)
# Instantiate and build a rips filtration
rips = cm.Rips(1) #Go up to 1D homology
rips.build(X)
dgmsrips = rips.diagrams()

plt.subplot(121)
plt.scatter(X[:, 0], X[:, 1])
plt.axis('square')
plt.title("Point Cloud")
plt.subplot(122)
plot_diagrams(dgmsrips)
plt.title("Rips Persistence Diagrams")
plt.tight_layout()
plt.show()