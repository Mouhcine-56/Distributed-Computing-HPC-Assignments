!........................................
function solve_1d_linearconv_pyccel(n0_u, u, n0_un, un, nt, nx, dt, dx, &
      c) bind(c) result(Out_0001)

  use mod_37b3genf, only: mod_solve_1d_linearconv_pyccel => &
      solve_1d_linearconv_pyccel
  use ISO_C_BINDING
  implicit none

  integer(C_INT), value :: n0_u
  real(C_DOUBLE), intent(inout) :: u(0:n0_u-1)
  integer(C_INT), value :: n0_un
  real(C_DOUBLE), intent(inout) :: un(0:n0_un-1)
  integer(C_LONG_LONG), value :: nt
  integer(C_LONG_LONG), value :: nx
  real(C_DOUBLE), value :: dt
  real(C_DOUBLE), value :: dx
  real(C_DOUBLE), value :: c
  integer(C_LONG_LONG) :: Out_0001


  Out_0001 = mod_solve_1d_linearconv_pyccel(u, un, nt, nx, dt, dx, c)

end function solve_1d_linearconv_pyccel
!........................................
