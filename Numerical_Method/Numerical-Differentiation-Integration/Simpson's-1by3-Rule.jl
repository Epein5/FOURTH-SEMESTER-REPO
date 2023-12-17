# Define the function for Simpson's 1/3 rule
function simpsons_one_third_rule(f, a, b, n)
    h = (b - a) / n
    s = f(a) + f(b)
    sum_odd = 0
    sum_even = 0
    for i in 1:n-1
        x = a + i * h
        if i % 2 == 0
            sum_even += f(x)
        else
            sum_odd += f(x)
        end
    end
    s += 2 * sum_even + 4 * sum_odd
    return (h / 3) * s
end

# Example usage:
f(x) = x^2

a_val = 0.0
b_val = 2.0
n_val = 100
simpsons_one_third_result = simpsons_one_third_rule(f, a_val, b_val, n_val)
println("Simpson's 1/3 Rule Result: $simpsons_one_third_result")
