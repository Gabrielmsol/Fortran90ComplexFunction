module gv
complex,dimension(:,:),allocatable :: z,f
integer,parameter                  :: n1=100,n2=500
real,parameter                     :: xi=-1,xf=1
real,parameter                     :: yi=-1,yf=1
real,parameter                     :: ri= 0,rf=1
real,parameter                     :: ai= 0,af=3.1415926*2
character(len=1000)                :: arq
integer,parameter                  :: n=10

end module gv
!!!!!!!!!!!!
program main
use gv 
implicit none 
integer :: i

!please substitute f to any function you want, it will be applied on itself n times, currently i am using Newton's method to
!aproximate fixed points. 
allocate(z(0:n1,0:n2))
allocate(f(0:n1,0:n2))
   call draw_z
   call write_z
   do i=1,n
      f=z-(z**5-1)/(5*z**4)
      z=f
      call write_f(1,i)
   end do
deallocate(f)
deallocate(z)
call system('cd data; gnuplot plot.glp')

end program main
!!!!!!!!!!!!!!!!
subroutine draw_z
use gv
implicit none 
integer :: i,j
real    :: dx,dy,dr,da

dr=(rf-ri)/n1
da=(af-ai)/n2
dx=(xf-xi)/n1
dy=(yf-yi)/n2
do i=0,n1
   do j=0,n2
      z(i,j)=(ri+dr*i)*exp((0,1)*(ai+da*j))
   end do
end do

end subroutine draw_z
!!!!!!!!!!!!!!!!!!!!!!
subroutine write_z
use gv
implicit none
integer :: i,j

open(1,file='data/zgrid.dat')
   do i=0,n1
      do j=0,n2
         write(1,1) real(z(i,j)),aimag(z(i,j))
      end do
   end do
close(1)

1 format(2(f10.5,2x))
end subroutine write_z
!!!!!!!!!!!!!!!!!!!!!
subroutine write_f(v1,v2)
use gv
implicit none
integer :: v1,v2,i,j

write(arq,1) v2
if (v2 .ge. v1) then
   open(2,file=arq)
      do i=0,n1
         do j=0,n2
            write(2,2) real(f(i,j)),aimag(f(i,j))
         end do
      end do
   close(2)
end if

1 format('data/fgrid_',i2.2,'.dat')
2 format(2(f10.5,2x))
end subroutine write_f
