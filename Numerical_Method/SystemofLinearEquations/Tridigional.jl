function tridiagonal_solver(a, b, c, d)
    n = length(d)
    c_prime = zeros(n)
    d_prime = zeros(n)

    c_prime[1] = c[1] / b[1]
    d_prime[1] = d[1] / b[1]

    for i in 2:n
        m = 1.0 / (b[i] - a[i] * c_prime[i - 1])
        c_prime[i] = c[i] * m
        d_prime[i] = (d[i] - a[i] * d_prime[i - 1]) * m
    end

    x = zeros(n)
    x[n] = d_prime[n]

    for i in (n - 1):-1:1
        x[i] = d_prime[i] - c_prime[i] * x[i + 1]
    end

    return x
end

# Example usage:
a = [0.0, 1.0, 1.0]  # Lower diagonal
b = [4.0, 4.0, 4.0]  # Main diagonal
c = [1.0, 1.0, 0.0]  # Upper diagonal
d = [5.0, 6.0, 5.0]  # Right-hand side

x = tridiagonal_solver(a, b, c, d)
println("Solution:")
println(x)
