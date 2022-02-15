program celerse

implicit none

integer num_frame, num_at, num_frame_del
character (len=1) char1(10000)
real*8, allocatable :: x(:,:), y(:,:), z(:,:)
real*8 mx, my, mz 
real*8, allocatable :: fx(:,:), fy(:,:), fz(:,:)
character (len=54) longchar1
character (len=20) energy(10000)
integer i, j, k
real*8 factor_energy, factor_force

open(10,file="system.arc",action="read")
open(12,file="input.data",action="write")

num_frame = 2000
num_frame_del=0
num_at = 81 ! WATER BOX HERE 
allocate(x(num_frame,num_at), y(num_frame,num_at), z(num_frame,num_at))
allocate(fx(num_frame,num_at), fy(num_frame,num_at), fz(num_frame,num_at))

! Reading of md.xyz file
do i = 1, num_frame_del
   read(10,*) num_at
   read(10,*)
   do j = 1, num_at
      read(10,*)
   end do
end do
do i = 1, num_frame-num_frame_del
   read(10,*) num_at
   read(10,*)
   do j = 1, num_at
      read(10,*) k, char1(j), x(i,j), y(i,j), z(i,j)
      fx(i,j)=0
      fy(i,j)=0
      fz(i,j)=0
   end do
   print *, "READING DONE !"
   energy(i)="0.00"
end do

factor_energy = 0.0367493 ! from eV to Hartree
factor_force = 51.42208619083232 ! from eV/Angstrom to Hartree/Bohr

! Write output file (with large box as we does not want PBC)
do i = 1, num_frame-num_frame_del
   write(12,*) "begin"
   write(12,*) "comment from toto"
   write(12,*) "lattice 17.615 0.0 0.0"
   write(12,*) "lattice 0.0 17.615 0.0"
   write(12,*) "lattice 0.0 0.0 17.615"
   do j = 1, num_at
      write(12,*) "atom ", x(i,j)*1.88973, y(i,j)*1.88973, z(i,j)*1.88973, char1(j), " 0 0 ", &
      fx(i,j)/factor_force, fy(i,j)/factor_force, fz(i,j)/factor_force
   end do
   write(12,*) "energy ", energy(i)
   write(12,*) "charge 0"
   write(12,*) "end"
   print *, "FRAME ", i, " DONE !"
end do

close(10)
close(12)

deallocate(x,y,z,fx,fy,fz)

end
