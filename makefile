#################################
#	Makefile of demo helloword  #
#################################

FOR =$(MPI)/mpif90 -IMODF 

EXE = demo

MPI = /opt/openmpi/1.4.3/bin
# ifort on my laptop (default one)#MPI=/opt/intel/compilers_and_libraries_2016.1.150/linux/mpi/intel64/bin/OUTPUT = OUT/out

OBJ = OF/io.o OF/mainWR.o OF/mainMR.o OF/main.o

#-==========================create executable: make  ===========#

$(EXE): $(OBJ)
	$(FOR): $(OBJ) -o $(EXE)

##-------------------- set code components:---------------------#
OF/io.o: io.f90
	$(FOR) -c io.f90 -o OF/io.o

OF/mainWR.o: mainWR.f90
	$(FOR) -c mainWR.f90 -o OF/mainWR.o

OF/mainMR.o: mainMR.f90
	$(FOR) -c mainMR.f90 -o OF/mainMR.o

OF/main.o: main.f90
	$(FOR) -c main.f90 -o OF/main.o

#------------> lines below a directive MUST start with TAB <-----------#
#----------------------- execute: make run --------------------------#
run:
# @mpirun -np 5 ./$(EXE) < inputdata.dat> $(OUTPUT)
# @mpirun -np 5 ./$(EXE) < inputdata.dat
	@mpirun -np 4 ./$(EXE)
reset:
	rm $(EXE) MODF/* OF/* ./*.mod
remove:
	rm OUT/*.dat
