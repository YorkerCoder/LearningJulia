#######################################################
#Defining a problem
#It will give out answers on the types you feed it ie/ both
#   u0 and tspan are float64
#######################################################
using DifferentialEquations
f(u,p,t) = 1.01*u
u0 = 1/2
tspan = (0.0, 1.0)
prob = ODEProblem(f,u0,tspan)
#######################################################

#######################################################
#After defining the problem you solve it using solve()
#We can control it using reltol to get a more accurate solution
#   at the cost of more time to solve
#We can change the reltol or abstol to get a faster, but
#   less accurate solution
#We can make the solver save every 0.1 time steps
#   if we use saveat=0.1 in the function
#If we care about the end only then we can use
#   save_everystep=false which only saves the final point
#######################################################
sol = solve(prob, Tsit5(), reltol=1E-8, abstol=1E-8)
#######################################################

using Plots
plot(sol,linewidth=5,title="Solution to the linear ODE with a thick line",
     xaxis="Time (t)",yaxis="u(t) (in μm)",label="My Thick Line!") # legend=false
plot!(sol.t, t->0.5*exp(1.01t),lw=3,ls=:dash,label="True Solution!")
