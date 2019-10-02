MODULE mainwr
    !
    CONTAINS
    
    SUBROUTINE WORKER(nWRs, myID)
        INCLUDE 'mpif.h'
        !
        INTEGER, PARAMETER :: r8 = SELECTED_REAL_KIND(15,307)
        !
        print *, 'Hello from worker ', myID
    END SUBROUTINE WORKER
    
    SUBROUTINE COOL( myID )
	include 'mpif.h'
	integer, parameter :: r8 = SELECTED_REAL_KIND(15,307)
	print *, 'HELLO COOL!!!', myID
    END SUBROUTINE COOL

END MODULE mainwr
