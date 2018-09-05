FROM kaylanb/desi:obiwan_rtd_jupyter
 
WORKDIR /usr/local/src

ADD . /usr/local/src

#install mpi4py
RUN source /srv/py3_venv/bin/activate && pip install mpi4py

#cfitsio, funpack, fpack
#I made a little change in cfitsio makefile to make fpack/funpack get install in /usr/bin
RUN cd ./cfitsio && ./configure --prefix=/usr && make && make fpack && make funpack && make install && make clean

#required by sextractor and psfex
RUN apt-get install libatlas-dev libatlas3-base libatlas-base-dev

#SExtractor
RUN cd ./trunk.r382 && ./configure --with-atlas-libdir=/usr/lib/ --with-atlas-incdir=/usr/include/atlas --prefix=/usr && make && make install 

#psfex
RUN cd ./psfex-3.17.1 && ./configure --with-atlas-libdir=/usr/lib/ --with-atlas-incdir=/usr/include/atlas --prefix=/usr  && make && make install   

#imcopy
RUN cd ./cexamples && gcc -o /usr/bin/imcopy imcopy.c -L. -lcfitsio -lm -lnsl 

#modhead
RUN cd ./cexamples && gcc -o /usr/bin/modhead modhead.c -L. -lcfitsio -lm -lnsl

#fitscopy
RUN cd ./cexamples && gcc -o /usr/bin/fitscopy fitscopy.c -L. -lcfitsio -lm -lnsl

#imarith
RUN  cd ./cexamples && gcc  -o /usr/bin/imarith imarith.c -L. -lcfitsio -lm -lnsl

#imlist
RUN  cd ./cexamples && gcc  -o /usr/bin/imlist imlist.c -L. -lcfitsio -lm -lnsl

#listhead
RUN  cd ./cexamples && gcc -o /usr/bin/listhead listhead.c -L. -lcfitsio -lm -lnsl

#liststruc
RUN  cd ./cexamples && gcc -o /usr/bin/liststruc liststruc.c -L. -lcfitsio -lm -lnsl

#tabcalc
RUN  cd ./cexamples && gcc -o /usr/bin/tabcalc tabcalc.c -L. -lcfitsio -lm -lnsl

#tablist
RUN  cd ./cexamples && gcc -o /usr/bin/tablist tablist.c -L. -lcfitsio -lm -lnsl

#tabmerge
RUN  cd ./cexamples && gcc -o /usr/bin/tabmerge tabmerge.c -L. -lcfitsio -lm -lnsl

#tabselect
RUN  cd ./cexamples && gcc -o /usr/bin/tabselect tabselect.c -L. -lcfitsio -lm -lnsl
