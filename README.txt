Before trying out the code, note:
* You need to have gfortran or intel compiler for Fortran and gnuplot, the code itself was only tested and compiled on gfortran.
* The code setup.f90 only works on Linux and Unix-like operating systems, since we use the 'mkdir' command,
  changing those two lines might suffice if not on Linux distribution.
* setup.f90 should be run only one time, by default it will create a data folder containing a plot.glp file which will be
  responsible for creating a pdf with 11 pages containing iterations of a function on the complex plane 10 times.
* Main.f90 should be run after setup is completed, an output folder will be created inside the data folder, there you can find your pdf.
* The purpose of this code is both to visualize transformations on the complex plane, and to show good undertanding of Fortran90.
