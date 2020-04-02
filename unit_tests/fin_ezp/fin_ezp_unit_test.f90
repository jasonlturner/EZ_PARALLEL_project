!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!     The GENESIS Project of EZ_PARALLEL, to create the initial version.
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
! TITLE            : EZ_PARALLEL
! PROJECT          : GENESIS
! MODULE           : UNIT_TEST
! URL              : https://github.com/jasonlturner/EZ_PARALLEL_project
! AFFILIATION      : University of Wisconsin-Madison
! DATE             : April 1st, 2020
! REVISION         : ALPHA 1.01
!
!> @author
!> Jason Turner
! DESCRIPTION:
!> \brief The unit test for the FIN_EZP subroutine.
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

PROGRAM FIN_EZP_UNIT_TEST

  USE EZ_PARALLEL
  
  IMPLICIT NONE

  ! Defines standard integer-, real-precision types.
  INCLUDE 'integer_types.h'
  INCLUDE 'real_types.h'

  REAL(dp) :: start_time, & !< Start time of the unit test.
     end_time !< End time of the unit test.

  CALL CPU_TIME(start_time)
  CALL MAIN
  CALL CPU_TIME(end_time)

  PRINT *, 'Execution time: ', end_time - start_time, '.'
  PRINT *, 'FIN_EZP unit test complete. Normal termination.'

  !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CONTAINS
  !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  !> @author Jason Turner, University of Wisconsin-Madison
  !> @brief
  !> Unit test for the EZ_PARALLEL initialization subroutine
  !
  !> STRUCTURE: 1) Reads the NAMELIST. Initializes MPI, prints the processor ID,
  !! and finalizes MPI.
  !
  !> \param[in] grid_count Number of unique grids the user wishes to decompose,
  ! "unique" being in terms of size and overlap.
  !~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  SUBROUTINE MAIN
    
    USE MPI

    IMPLICIT NONE

    INTEGER(qb) :: grid_count, &
         ierror

    grid_count = 10
    
    CALL INIT_EZP(grid_count)

    ! Each processor prints out its processor ID.
    PRINT *, "proc_id: ", proc_id, " of ", proc_count, " processors."

    CALL FIN_EZP

    ! This line will prompt an error.
    CALL MPI_COMM_RANK(MPI_COMM_WORLD, proc_id, ierror)

    RETURN

  END SUBROUTINE MAIN
  
END PROGRAM FIN_EZP_UNIT_TEST
