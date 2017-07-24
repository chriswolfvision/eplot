# eplot

eplot ("easy gnuplot") is a ruby script which allows to pipe data easily through gnuplot and create plots quickly, which can be saved in postscript, PDF, PNG or EMF files. Plotting of multiple files into a single diagram is supported. 

The easiest way is to pipe the data through the program. Let's assume that you have a file called data.txt, the syntax would be:

cat data.txt | eplot

Which will give a result looking like this: 

![alt text](doc/img.png)

There are several ways to create multiple plots on a single diagramm:

    -m: Several input files: Just give the name of the files on the command line together with the -m option
    -M: A single file, the data for the different curves are in different columns: give the name of the file on the command line or pipe the data through standard in, and set the -M option
    -S: A single file, the data for the different curves are in the same column, but the curves are separated by blank lines: give the name of the file on the command line or pipe the data through standard in, and set the -S option

See the online documentation for more info
http://liris.cnrs.fr/christian.wolf/software/eplot/index.html
