program celerse

implicit none

integer i, j
character (len=2) char1
real*8 x, y, z
character (len=1) nom1
character (len=2) nom2
character (len=3) nom3
character (len=4) nom4
character (len=50) file_name1, file_name2

do i = 1, 1000

        if (i < 10) then
                write(nom1,'(i1)') i
                file_name1=nom1//".xyz"
                file_name2=nom1//"-cp2k.xyz"
                open(1,file=file_name1,action="read")
                open(2,file=file_name2,action="write")
                read(1,*) 
                read(1,*)
                write(2,*) "&CELL"
                write(2,*) "ABC 9.3215 9.3215 9.3215"
                write(2,*) "&END CELL"
                write(2,*) "&COORD"
                do j = 1, 81
                        read(1,*) char1, x, y, z
                        write(2,*) char1, x, y, z
                end do
                write(2,*) "&END COORD"
        end if

        if (i >= 10 .and. i < 100) then
                write(nom2,'(i2)') i
                file_name1=nom2//".xyz"
                file_name2=nom2//"-cp2k.xyz"
                open(1,file=file_name1,action="read")
                open(2,file=file_name2,action="write")
                read(1,*)
                read(1,*)
                write(2,*) "&CELL"
                write(2,*) "ABC 9.3215 9.3215 9.3215"
                write(2,*) "&END CELL"
                write(2,*) "&COORD"
                do j = 1, 81
                        read(1,*) char1, x, y, z
                        write(2,*) char1, x, y, z
                end do
                write(2,*) "&END COORD"
        end if

        if (i >= 100 .and. i < 1000) then
                write(nom3,'(i3)') i
                file_name1=nom3//".xyz"
                file_name2=nom3//"-cp2k.xyz"
                open(1,file=file_name1,action="read")
                open(2,file=file_name2,action="write")
                read(1,*)
                read(1,*)
                write(2,*) "&CELL"
                write(2,*) "ABC 9.3215 9.3215 9.3215"
                write(2,*) "&END CELL"
                write(2,*) "&COORD"
                do j = 1, 81
                        read(1,*) char1, x, y, z
                        write(2,*) char1, x, y, z
                end do
                write(2,*) "&END COORD"
        end if

        if (i >= 1000 .and. i < 10000) then
                write(nom4,'(i4)') i
                file_name1=nom4//".xyz"
                file_name2=nom4//"-cp2k.xyz"
                open(1,file=file_name1,action="read")
                open(2,file=file_name2,action="write")
                read(1,*)
                read(1,*)
                write(2,*) "&CELL"
                write(2,*) "ABC 9.3215 9.3215 9.3215"
                write(2,*) "&END CELL"
                write(2,*) "&COORD"
                do j = 1, 81
                        read(1,*) char1, x, y, z
                        write(2,*) char1, x, y, z
                end do
                write(2,*) "&END COORD"
        end if

        close(1)
        close(2)

end do

print *, "PROCESS DONE !"

end
