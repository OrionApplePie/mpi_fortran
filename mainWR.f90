MODULE mainWR
    !
    CONTAINS
    SUBROUTINE WORKER(nWRs, myID)
        INCLUDE 'mpif.h'
        !
        INTEGER, PARAMETER :: r8 = SELECTED_REAL_KIND(15,307)
        !
        Print *, 'Hello from worker ', myID
    END SUBROUTINE WORKER
END MODULE mainWR
