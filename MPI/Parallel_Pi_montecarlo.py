#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Dec 15 19:43:54 2020

@author: mouhcine
"""

import random
from mpi4py import MPI
import time
COMM=MPI.COMM_WORLD
rank=COMM.Get_rank()
size=COMM.Get_size()
t = time.time()
nb=10000000
nbc=int(nb/size)+(size==(rank+1))*(nb%size)
k=0
print("I ",rank," will generate ", nbc)
for i in range(nbc):
	x=random.uniform(-1, 1) 
	y=random.uniform(-1, 1)
	r2=x**2+y**2
	k=k+(r2<1)

inner_point=COMM.reduce(k,op=MPI.SUM ,root=0)

if rank==0:
	time=time.time()-t
	pi=4*inner_point/nb
	print("pi= ",pi, 'in ',time,' s')
	
 	

