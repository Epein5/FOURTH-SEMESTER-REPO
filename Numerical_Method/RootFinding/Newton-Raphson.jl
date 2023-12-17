# Define the function
function f(x)
    return x^3 - 2x^2 + 4
end

# Define the derivative of the function
function df(x)
    return 3x^2 - 4x
end

# Implement Newton-Raphson method
function newton_raphson(x0, tolerance, max_iterations)
    x = x0
    iteration = 0
    while abs(f(x)) > tolerance && iteration < max_iterations
        x -= f(x) / df(x)
        iteration += 1
    end
    if abs(f(x)) <= tolerance
        println("Root found at x = ", x, " after ", iteration, " iterations.")
    else
        println("Root not found within tolerance after ", max_iterations, " iterations.")
    end
    return x
end

# Initial guess, tolerance, and maximum iterations
x_initial_guess = 1.5
tolerance_value = 1e-6
max_iterations_value = 100

# Apply the Newton-Raphson method
newton_raphson(x_initial_guess, tolerance_value, max_iterations_value)
