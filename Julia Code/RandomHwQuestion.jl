using Plots

#Need using Plots for the ones below
#plotly()#The plotly.jl backend for interactivity
#plotlyjs()#plotlyjs.jl backend that more interactive than plotly.js
pyplot()#pyplot.jl backend that has more features, but may take more time to generate
R = 2
a = zeros(14,1)
#Ax=δ
for N = 2:15
    δ = zeros(N)
    δ[1] = 1
    A = zeros(N,N)
    for n = 1:N#What you'll use to keep index, note n is an equation
        nc = n - 1#What you'll actually use to calculate
        for p = 1:N#What you'll use to keep index of the current A eg A0 = index 1
            pc = p-1#Use to perform the actual calculation
            A[n, p] = (-1.0)^(nc+pc) * (factorial(big(nc + pc))/(factorial(big(nc))*factorial(big(pc)))) * R^(-1.0-nc-nc)
        end
        A[n,n] = A[n,n] + 1#Add one to the diagnol at the end
    end

    x = A\δ
    a[N-1] = x[1]
end

#Now plot it
plot(2:1:15, a)
xlabel!("N")
ylabel!("A0")#Note the ! mutates the plot
