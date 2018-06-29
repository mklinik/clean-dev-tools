#!/bin/bash

# This script filters memory profiling output of clean programs and transforms it into gnuplot data
# files.

# Usage:
# 1. Compile your clean executable with ShowGC: True and ShowStackSize: True
# 2. Run your clean executable
#        $ ./myCleanProg 2> memory.txt
# 3. Filter output with this script
#        $ profile.sh memory.txt
# This script generates two files heap.txt and stack.txt which are ready to be plotted with gnuplot
# 4. Run gnuplot
#        $ gnuplot plotMemory.gnuplot

# You must compile your clean executable with the following options in the .prj file:
#       ShowGC: True
#       ShowStackSize: True

INPUT="$1"
grep 'Heap' "$INPUT" > heap.txt
grep 'A stack' "$INPUT" > stack.txt
