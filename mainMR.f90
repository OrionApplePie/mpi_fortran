module mainMR
    use io
    contains

    subroutine MASTER( NWRS )
        include 'mpif.h'
        call dateStampPrint
        end subroutine MASTER

    end module mainMR

