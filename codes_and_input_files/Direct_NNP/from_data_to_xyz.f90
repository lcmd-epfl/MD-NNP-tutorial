program celerse

implicit none

integer i, k
character (len=1) nom1
character (len=2) nom2
character (len=3) nom3
character (len=4) nom4
character (len=50) :: file_name1
real*8 x, y, z
character (len=5) char1
character (len=2) char2
real*8 factor

factor=1.88973

open(10,file="new-input.data",action="read")

do i = 1, 1000
        if (i < 10) then
                write(nom1, '(i1)') i
                file_name1 = nom1//".xyz"
                open(20,file=file_name1,action="write")
                do k = 1, 5
                        read(10,*)
                end do
                write(20,*) 81
                write(20,*)
                do k = 6, 86
                        read(10,*) char1, x, y, z, char2
                        write(20,*) char2, x/factor, y/factor, z/factor
                end do
                do k = 87, 89
                        read(10,*)
                end do
        end if
        if (i>=10 .and. i < 100) then
                write(nom2, '(i2)') i
                file_name1 = nom2//".xyz"
                open(20,file=file_name1,action="write")
                do k = 1, 5
                        read(10,*)
                end do
                write(20,*) 81
                write(20,*)
                do k = 6, 86
                        read(10,*) char1, x, y, z, char2
                        write(20,*) char2, x/factor, y/factor, z/factor
                end do
                do k = 87, 89
                        read(10,*)
                end do
        end if
        if (i>=100 .and. i < 1000) then
                write(nom3, '(i3)') i
                file_name1 = nom3//".xyz"
                open(20,file=file_name1,action="write")
                do k = 1, 5
                        read(10,*)
                end do
                write(20,*) 81
                write(20,*)
                do k = 6, 86
                        read(10,*) char1, x, y, z, char2
                        write(20,*) char2, x/factor, y/factor, z/factor
                end do
                do k = 87, 89
                        read(10,*)
                end do
        end if
        if (i>=1000 .and. i < 10000) then
                write(nom4, '(i4)') i
                file_name1 = nom4//".xyz"
                open(20,file=file_name1,action="write")
                do k = 1, 5
                        read(10,*)
                end do
                write(20,*) 81
                write(20,*)
                do k = 6, 86
                        read(10,*) char1, x, y, z, char2
                        write(20,*) char2, x/factor, y/factor, z/factor
                end do
                do k = 87, 89
                        read(10,*)
                end do
        end if
        close(20)
end do

close(10)

end
