module mod_rgkk4izj

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_diff_pyccel(u, un, nt, dt, dx, dy, nu) result(Out_0001 &
      )

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: u(0:,0:)
  real(C_DOUBLE), intent(inout) :: un(0:,0:)
  integer(C_LONG_LONG), value :: nt
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: dy
  real(C_DOUBLE), value :: nu
  integer(C_LONG_LONG) :: row
  integer(C_LONG_LONG) :: col
  integer(C_LONG_LONG) :: n
  integer(C_LONG_LONG) :: i
  integer(C_LONG_LONG) :: j

  row = size(u, 2)
  col = size(u, 1)
  u(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  n = 0_C_LONG_LONG
  do while (n < nt)
    do i = 1_C_LONG_LONG, row - 1_C_LONG_LONG-1_C_LONG_LONG, &
      1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col - 1_C_LONG_LONG-1_C_LONG_LONG, &
      1_C_LONG_LONG
        un(j, i) = u(j, i)
      end do
    end do
    do i = 1_C_LONG_LONG, row - 1_C_LONG_LONG-1_C_LONG_LONG, &
      1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col - 1_C_LONG_LONG-1_C_LONG_LONG, &
      1_C_LONG_LONG
        u(j, i) = un(j, i) - nu * dt * ((2_C_LONG_LONG * un(j, i) - un(j &
      , i - 1_C_LONG_LONG) - un(j, i + 1_C_LONG_LONG)) / dx ** &
      2_C_LONG_LONG + (2_C_LONG_LONG * un(j, i) - un(j - 1_C_LONG_LONG, &
      i) - un(j + 1_C_LONG_LONG, i)) / dy ** 2_C_LONG_LONG)
      end do
    end do
    n = n + 1_C_LONG_LONG
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_diff_pyccel
!........................................

end module mod_rgkk4izj
