# eplot

eplot ("easy gnuplot") is a ruby script which allows to pipe data easily through gnuplot and create plots quickly, which can be saved in postscript, PDF, PNG or EMF files. Plotting of multiple files into a single diagram is supported. 

## One plot per diagram

The easiest way is to pipe the data through the program. Let's assume that you have a file called data.txt, the syntax would be:

```
cat data.txt | eplot
```

Which will give a result looking like this: 

![alt text](doc/eplot_single.gif)

If the input data is available in a file (as opposed to being the output of another program), then you may as well give its name as an argument to eplot. This works with several data files, which will be opened in seperate windows:

```
eplot file1
eplot file1 file2 file3
``

## Multiple plots in a single diagram

There are several ways to create multiple plots on a single diagramm:

    -m: Several input files: Just give the name of the files on the command line together with the -m option
    -M: A single file, the data for the different curves are in different columns: give the name of the file on the command line or pipe the data through standard in, and set the -M option
    -S: A single file, the data for the different curves are in the same column, but the curves are separated by blank lines: give the name of the file on the command line or pipe the data through standard in, and set the -S option


Examples:

```
eplot -m 'Measured A' 'Measured B' 'Measured C' 'Simulated A' 'Simulated B' 'Simulated C'
eplot -M singlefile.dat
```

![alt text](doc/eplot_multiple.gif)


See the online documentation for more info
http://liris.cnrs.fr/christian.wolf/software/eplot/index.html
