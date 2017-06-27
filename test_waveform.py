#!/usr/bin/env python2

from __future__ import print_function
from pycbc.waveform import get_td_waveform
import numpy as np

hp, hc = get_td_waveform(approximant='IMRPhenomC',
                         mass1=10,mass2=10,
                         spin1z=0.9,
                         delta_t=1.0/4096,
                         f_lower=40)

print(hc.max())
