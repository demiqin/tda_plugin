import numpy as np
import pandas as pd
import sktda

from ripser import ripser
from persim import plot_diagrams

from histomicstk.segmentation import label as htk_label

import logging
logging.basicConfig(level=logging.CRITICAL)

from ctk_cli import CLIArgumentParser

def compute_PD_features(im_label):

    feature_list = []

    data_test = np.random.random((100,2))
    data = im_label
    diagrams = ripser(data)['dgms']
    plot_diagrams(diagrams, show=True)

    fdata = pd.concat(feature_list, axis=1)

    print fdata

if __name__ == "__main__":
    main(CLIArgumentParser().parse_args())

