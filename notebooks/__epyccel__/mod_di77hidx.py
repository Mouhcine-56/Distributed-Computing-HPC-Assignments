@types('float[:,:]','float[:,:]','int','float','float','float','float')
def solve_2d_linearconv_pyccel(u, un, nt, dt, dx, dy, c):
    row, col = u.shape
    n=0
    while n<nt:
        for i in range(1,row):
                for j in range(1,col):un[i,j]=u[i,j]
        for i in range(1,row):
                for j in range(1,col):
                    u[i,j]=un[i,j]-c*dt*((un[i,j]-un[i-1,j])/dx+(un[i,j]-un[i,j-1])/dy)
    return 0
