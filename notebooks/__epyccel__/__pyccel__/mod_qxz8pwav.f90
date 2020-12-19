module mod_qxz8pwav

use ISO_C_BINDING

implicit none

contains

!........................................
function solve_2d_nonlinearconv_pyccel(u, un, v, vn, nt, dt, dx, dy, c) &
      result(Out_0001)

  implicit none

  integer(C_LONG_LONG) :: Out_0001
  real(C_DOUBLE), intent(inout) :: u(0:,0:)
  real(C_DOUBLE), intent(inout) :: un(0:,0:)
  real(C_DOUBLE), intent(inout) :: v(0:,0:)
  real(C_DOUBLE), intent(inout) :: vn(0:,0:)
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

  !##Assign initial conditions
  !#set hat function I.C. : u(.5<=x<=1 && .5<=y<=1 ) is 2
  u(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  !#set hat function I.C. : v(.5<=x<=1 && .5<=y<=1 ) is 2
  v(Int(0.5_C_DOUBLE / dx, 8):Int(1_C_LONG_LONG / dx + 1_C_LONG_LONG, 8 &
      ) - 1_C_LONG_LONG, Int(0.5_C_DOUBLE / dy, 8):Int(1_C_LONG_LONG / &
      dy + 1_C_LONG_LONG, 8) - 1_C_LONG_LONG) = 2_C_LONG_LONG
  row = size(u, 2)
  col = size(u, 1)
  n = 0_C_LONG_LONG
  do while (n < nt)
    do i = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        un(j, i) = u(j, i)
        vn(j, i) = v(j, i)
      end do
    end do
    do i = 1_C_LONG_LONG, row-1_C_LONG_LONG, 1_C_LONG_LONG
      do j = 1_C_LONG_LONG, col-1_C_LONG_LONG, 1_C_LONG_LONG
        u(j, i) = un(j, i) - un(j, i) * dt * (un(j, i) - un(j, i - &
      1_C_LONG_LONG)) / dx - vn(j, i) * dt * (un(j, i) - un(j - &
      1_C_LONG_LONG, i)) / dy
        v(j, i) = vn(j, i) - un(j, i) * dt * (vn(j, i) - vn(j, i - &
      1_C_LONG_LONG)) / dx - vn(j, i) * dt * (vn(j, i) - vn(j - &
      1_C_LONG_LONG, i)) / dy
      end do
    end do
    n = n + 1_C_LONG_LONG
  end do
  Out_0001 = 0_C_LONG_LONG
  return

end function solve_2d_nonlinearconv_pyccel
!........................................

end module mod_qxz8pwav
