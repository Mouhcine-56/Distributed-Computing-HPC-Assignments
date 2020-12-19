module mod_di77hidx

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_linearconv_pyccel(u, un, nt, dt, dx, dy, c) result( &
      Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: u(0:,0:)
  real(C_DOUBLE), intent(inout) :: un(0:,0:)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: i
  integer(C_LONG_LONG) :: j

  row = size(u, 2)
  col = size(u, 1)
  n = 0_C_LONG_LONG
  do while (n < nt)
    do i = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        un(j, i) = u(j, i)
      end do
    end do
    do i = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        u(j, i) = un(j, i) - c * dt * ((un(j, i) - un(j, i - &
      1_C_LONG_LONG)) / dx + (un(j, i) - un(j - 1_C_LONG_LONG, i)) / dy &
      )
      end do
    end do
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_linearconv_pyccel
!........................................

end module mod_di77hidx
