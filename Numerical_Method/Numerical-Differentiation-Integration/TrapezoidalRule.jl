# Define the function for trapezoidal rule
function trapezoidal_rule(f, a, b, n)
    h = (b - a) / n
    s = (f(a) + f(b)) / 2
    for i in 1:n-1
        s += f(a + i * h)
    end
    return s * h
end

# Example usage:
f(x) = x^2

a_val = 0.0
b_val = 2.0
n_val = 100
trapezoidal_result = trapezoidal_rule(f, a_val, b_val, n_val)
println("Trapezoidal Rule Result: $trapezoidal_result")
