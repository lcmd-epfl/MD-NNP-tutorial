program celerse

implicit none

character (len=170) char1
integer i, tab(1000), j
integer k, cpt

open(10,file="cursel.landmarks",action="read")

do i = 1, 1000
        read(10,*) tab(i)
        tab(i) = tab(i) + 1
end do

close(10)

open(20,file="input.data",action="read")
open(30,file="new-input.data",action="write")

do i = 1, 1000
        do j = 2, 1000
                if (tab(i) == tab(j) .and. i .ne. j) then
                        print *, " WARNING ! structure repeated: ", tab(i)
                end if
        end do
end do

do i = 1, 2000
        cpt = 0
        do j = 1, 1000
                if (tab(j) == i) cpt = 1
        end do
        if (cpt == 0) then
                do k = 1, 89
                        read(20,*) char1
                end do
        else
                do k = 1, 89
                        read(20,'(a)') char1
                        write(30,*) char1
                end do
        end if
end do

close(20)
close(30)
print *, "PROCESS DONE !"

end
