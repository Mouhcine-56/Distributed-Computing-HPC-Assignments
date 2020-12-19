@types('float[:]','float[:]','int','int','float','float','float')
def solve_1d_burger_pyccel(u, un, nt, nx, dt, dx, nu):
    n=0
    while n<nt:
        for k in range(nx-1): un[k]=u[k]
        for i in range(1,nx-1):
            u[i]=un[i]+nu*dt*(un[i-1]+un[i+1]-2*un[i])/(dx**2)-un[i]*dt*(un[i]-un[i-1])/dx
        n+=1
    return 0
