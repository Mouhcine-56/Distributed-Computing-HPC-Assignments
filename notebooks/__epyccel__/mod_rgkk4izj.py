@types('float[:,:]','float[:,:]','int','float','float','float','float')
def solve_2d_diff_pyccel(u, un, nt, dt, dx, dy, nu):
    row, col = u.shape
    u[int(.5 / dy):int(1 / dy + 1),int(.5 / dx):int(1 / dx + 1)] = 2
    n=0
    while n<nt:
        for i in range(1,row-1):
                for j in range(1,col-1):un[i,j]=u[i,j]
        for i in range(1,row-1):
                for j in range(1,col-1):
                    u[i,j]=un[i,j]-nu*dt*((2*un[i,j]-un[i-1,j]-un[i+1,j])/dx**2+(2*un[i,j]-un[i,j-1]-un[i,j+1])/dy**2)
        n+=1   
        
    return 0
