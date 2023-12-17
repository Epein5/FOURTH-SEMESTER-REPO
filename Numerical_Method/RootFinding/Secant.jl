# Define the function whose root we want to find
function f(x)
    return x^3 - 2x - 5
end
function secant_method(f, x0, x1, tolerance, max_iterations)
    x_prev = x0
    x_curr = x1
    iterations = 0

    while abs(f(x_curr)) > tolerance && iterations < max_iterations
        x_next = x_curr - f(x_curr) * (x_curr - x_prev) / (f(x_curr) - f(x_prev))
        x_prev = x_curr
        x_curr = x_next
        iterations += 1
    end

    if iterations == max_iterations
        println("Maximum iterations reached")
    else
        println("Root found at x = $x_curr after $iterations iterations")
    end
end
# Initial guesses and tolerance
x0 = 2.0
x1 = 3.0
tolerance = 1e-6
max_iterations = 100

# Call the secant method function
secant_method(f, x0, x1, tolerance, max_iterations)
