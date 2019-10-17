import numpy as np
import pandas as pd

import numpy as np
import matplotlib.pyplot as plt
import cechmate as cm
from persim import plot_diagrams
import tadasets

from histomicstk.segmentation import label as htk_label

import logging
logging.basicConfig(level=logging.CRITICAL)

from ctk_cli import CLIArgumentParser

def main(args):

    feature_list = []

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
    
    # data_test = np.random.random((100,2))
    #data = im_label

    #fdata = pd.concat(feature_list, axis=1)

#print fdata


if __name__ == "__main__":
    main(CLIArgumentParser().parse_args())

