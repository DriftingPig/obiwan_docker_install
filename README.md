# obiwan_more
1.

extra packages required by obiwan:

mpi4py

cfitsio: CFITSIO_VERSION 3.37; CFITSIO_SONAME 2 
        -- packages dependent on ciftsio: funpack, modhead, imcopy

psfex

sextractor


I made an image called driftingpig/obiwan_composit:v3 on NERSC. It currently passes the test til running one brick.

2.

The glob function here:

https://github.com/legacysurvey/obiwan/blob/1810927aaad3cf458ada3962576355727c464ca6/py/obiwan/kenobi.py#L285

needs to be changed to:
found= glob('%s/* /* /%s' % (dirs['proja'],base), recursive=True)

so as the next glob function

3. You will see a lot of FITSIO error in satge_tims, this will not affect the process. When Some psfex file is missing, it raises a FITSIO error and makes a new file to use. 
