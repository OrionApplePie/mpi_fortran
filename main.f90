PROGRAM main
    USE mainwr
    USE mainmr
    INCLUDE 'mpif.h'

    INTEGER, PARAMETER :: r8 = selected_real_kind(15,307)
    INTEGER :: ierr, nPROC, nWRs, mster, myID
    REAL(r8) :: tt0, tt1

    CALL MPI_INIT(IERR)
    CALL MPI_COMM_SIZE( MPI_COMM_WORLD, nPROC, IERR)
    
    mster = 0
    nWRs = nPROC - 1
    
    call MPI_COMM_RANK(MPI_COMM_WORLD, myID, IERR) !..assigns myID
    
    IF (myID .EQ. mster) THEN 
        tt0 = MPI_WTIME()
        CALL MASTER( nWRs )
        tt1 = MPI_WTIME()
        PRINT *, '>>>main>>> MR timing = ', tt1 - tt0, ' sec on ', nWR, ' WRs'

    else
        call worker( nWRs, myID)
	CALL COOL(myID)
    end if

    CALL MPI_FINALIZE(IERR)

END PROGRAM main
