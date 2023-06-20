program setup
implicit none

call system('mkdir data')
call system('mkdir data/out')
open(1,file='data/plot.glp')
   write(1,*) 'set terminal pdf'
   write(1,*) 'set output "out/plot.pdf"'
   write(1,*) 'set size ratio -1'
   write(1,*) 'set xrange [-1.2:1.2]'
   write(1,*) 'set yrange [-1.2:1.2]'
   write(1,*) 'set object rectangle from screen 0,0 to screen 1,1 fillcolor rgb "#303031" behind'
   write(1,*) 'set xtics tc rgb "#c0c5ce"'
   write(1,*) 'set ytics tc rgb "#c0c5ce"'
   write(1,*) 'set palette defined ( 0 "yellow",0.25 "orange",0.5 "red",0.75 "#bb21bb",1 "blue")'
   write(1,*) 'plot "zgrid.dat" u 1:2:0 w p pt 7 ps 0.1 lc palette z notitle'
   write(1,*) 'do for [i=1:9] {'
   write(1,*) 'plot "fgrid_0".i.".dat" u 1:2:0 w p pt 7 ps 0.1 lc palette z notitle'
   write(1,*) '}'
   write(1,*) 'do for [i=10:10] {'
   write(1,*) 'plot "fgrid_".i.".dat" u 1:2:0 w p pt 7 ps 0.1 lc palette z notitle'
   write(1,*) '}'
close(1)
end program setup
