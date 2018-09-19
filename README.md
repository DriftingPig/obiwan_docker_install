# obiwan_more

extra packages required by obiwan:

mpi4py

cfitsio: CFITSIO_VERSION 3.37; CFITSIO_SONAME 2 
        -- packages dependent on ciftsio: funpack, modhead, imcopy

psfex

sextractor


I made an image called driftingpig/obiwan_composit:v3 on NERSC. It currently passes the test til running one brick.

The glob function here:

https://github.com/legacysurvey/obiwan/blob/1810927aaad3cf458ada3962576355727c464ca6/py/obiwan/kenobi.py#L285

needs to be changed to:
found= glob('%s//*//*/%s' % (dirs['proja'],base), recursive=True)

so as the next glob function
