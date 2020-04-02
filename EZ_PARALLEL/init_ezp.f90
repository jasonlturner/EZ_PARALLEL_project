!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
!> @author Jason Turner, University of Wisconsin-Madison
!> @brief
!> The EZ_PARALLEL initialization subroutine.
!> Initializes MPI, allocates memory for the grid decomposition list, and stores
!! frequenctly used variables.
!
!> \param[in] grid_count Number of unique grids the user wishes to decompose,
! "unique" being in terms of size and overlap.
!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

SUBROUTINE INIT_EZP(grid_count)
  
  USE MPI
  
  IMPLICIT NONE

  INTEGER :: grid_count
  INTEGER :: ierror

  CALL MPI_INIT(ierror)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, proc_id, ierror)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, proc_count, ierror)

  ALLOCATE(grid_decomps(grid_count))
 
END SUBROUTINE INIT_EZP

