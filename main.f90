PROGRAM main
    USE mainwr
    USE mainmr
    INCLUDE 'mpif.h'

    INTEGER, PARAMETER :: r8 = selected_real_kind(15,307)
    INTEGER :: ierr, nPROC, nWRs, mster, myID
    REAL(r8) :: tt0, tt1

    CALL MPI_INIT(IERR)
    CALL MPI_COMM_SIZE( MPI_COMM_WORLD, NPROC, IERR)

    mster = 0
    nWRs = nPROC - 1

    IF (myID .eq. mster) THEN 
        tt0 = MPI_WTIME()
        CALL MASTER( nWRs )
        
        tt1 = MPI_WTIME()
            PRINT *, '>>>main>>> MR timing= ', tt1 - tt0, ' sec on ', nWR, ' WRs'
    ELSE
        CALL WORKER( nWRs, myID)
    endif

    call MPI_FINALIZE(IERR)

end program main
