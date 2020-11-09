#!/usr/bin/env python
# coding: utf-8

# In[3]:


from ngspicedata import *
from pylab import *
import matplotlib.pyplot as plt

snm_sram=NgspiceData("sesram.raw")
sig_names = snm_sram.lssig('print') 
y_25_1 = snm_sram.evalsig('nqbar1')
x_25_1 = snm_sram.evalsig('nq1')

y_25_2 = snm_sram.evalsig('nqbar2')
x_25_2 = snm_sram.evalsig('nq2')

#1st Invereter
plt.plot(y_25_1,x_25_1)
plt.show()

## 2nd iNVERTER
plt.plot(x_25_2,y_25_2)
plt.show()


# In[ ]:




