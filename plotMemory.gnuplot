set terminal x11
set multiplot layout 3,1 rowsfirst
plot 'heap.txt' using 6 title "heap"
plot 'stack.txt' using 3 title "A stack"
plot 'stack.txt' using 7 title "BC stack"
pause -1
