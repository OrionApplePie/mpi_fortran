MODULE io
    CONTAINS

    subroutine dateStampPrint
        integer :: out_unit
        character(8) :: date
        character(10) :: time
        character(5)  :: zone
        integer, dimension(8) :: values
        character( len = 9 ), parameter, dimension(12) :: month = (/ &
        'January  ', 'February ', 'March    ', 'April    ', &
        'May      ', 'June     ', 'July     ', 'August   ', &
        'September', 'October  ', 'November ', 'December ' /)
        !
        call date_and_time(date,time,zone,values)
        write(*,*) "#############################################################"
        write(*,*) "Demo MPI hello word"
        write (*, '(15x,a,a1,i2,a1,i4,2x,i2,a1,i2.2,a1,i2.2,a1)' ) &
            trim ( month( values(2)) ), '-', values(3), '-', values(1),values(5), & 
                ':', values(6), ':', values(7), '.'
        write(*,*) "#############################################################"
    end subroutine  dateStampPrint

END MODULE io
