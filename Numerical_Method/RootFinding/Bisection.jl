function bisection(f, a, b, tol, max_iters)
    @assert f(a) * f(b) < 0 "Initial values should have different signs"

    iter = 0
    while iter < max_iters
        c = (a + b) / 2.0
        if abs(f(c)) < tol
            println("Root found at $c")
            return c
        end

        if f(a) * f(c) < 0
            b = c
        else
            a = c
        end

        iter += 1
    end

    println("Maximum iterations reached")
    return nothing
end

# Example usage:
f(x) = x^2 - 2  # Define your function here
a, b = 1.0, 2.0  # Initial interval [a, b]
tolerance = 1e-6
max_iterations = 100

bisection(f, a, b, tolerance, max_iterations)
