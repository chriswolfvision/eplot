#!/usr/bin/ruby
# **************************************************************************
# ec (say "extract column")
# Written by Christian Wolf
#
# This program is free software; you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation; either version 2 of the License, or     
# (at your option) any later version.                                   
#                                                                         
# This program is distributed in the hope that it will be useful,       
# but WITHOUT ANY WARRANTY; without even the implied warranty of        
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         
# GNU General Public License for more details.                          
#                                                                         
# You should have received a copy of the GNU General Public License     
# along with this program; if not, write to the                         
# Free Software Foundation, Inc.,                                       
# 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.   
#
# **************************************************************************
#
# Changelog:
# 2.1  21.06.2009: Included range processing, i.e. columns 1-16
# 2.0  13.10.2005: Port to the ruby programming language
# 1.0  03.07.2005: changed syntax: allow multiple rows to be selected
# 0.5  xx.xx.2002: start of project
# **************************************************************************

$Version="2.1 21.06.2009"

$help=<<END_MESSAGE
ec is a tool which is able to extract columns from a text file. Just pipe 
your data through the ec command and specify the column indices as arguments
(columns begin with 1), e.g.:

cat data.txt | ec 2 3 

Ranges can be specified using the dash operator, i.e. 4-7. Do not put
whitespace before and after the dash. The starting and endpoint need to
be specified, i.e. -3 or 7- are not allowed.
	
ec is also usefull if the columns in the original file are not separated by 
whitespace but by another character. The character separater used by ec 
can configured by adding it on the command line preceeded by a dash. 
The output character separater is always whitespace. If, for example, 
you have a file whose columns are seperated by a semicolon and you want to 
plot columns 5 and 3, use the command:

cat data.txt | ec -; 5 3

License: GPL; this is free software. There is absolutely NO warranty!!
END_MESSAGE

# ---- The usage message
def usage
	printf "usage: %s [ -<separator> ] { <column-number> }\n",$0
	printf "\n%s\n",$help
	exit 1
end

# ---- the main program
def main
	
	# ---- Check Arguments
	usage if ARGV.length < 1
	usage if ARGV[0]=="-h"
	if ARGV[0]=="-v"
		printf "ec version %s\n",$Version
		printf "Written by Christian Wolf\n"
		printf "License: GPL; this is free software. "
		puts "There is absolutely NO warranty!!"
		exit 0
	end
	
	# ---- Create the delimiter
	delimiter=" "
	delimiter=ARGV[0][1,ARGV[0].length-1] if ARGV[0][0,1]=="-"
	
	# ---- Create the array with separator indices
	indices=[]
	ARGV.each do |x| 
	   if x[0,1]!="-"
	       pos=x.index("-") 
	       if pos==nil
	           indices.push(x.to_i-1) 
	       else
	           ibeg=x[0,pos].to_i
	           iend=x[pos+1,x.length-pos].to_i
	           (ibeg..iend).each { |y| indices.push(y-1) }
	       end
	   end
	end
	
	# ---- Traverse the lines
	while line = $stdin.gets
		line["\n"]=""
		arr=line.split(delimiter)
		indices.each { |i| printf "%s ",arr[i] }
		puts
	end
end

main
