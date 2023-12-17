function simpsons_three_eighth_rule(f, a, b, n)
    h = (b - a) / n
    s = f(a) + f(b)
    sum_3k = 0
    sum_3k1 = 0
    sum_3k2 = 0
    for i in 1:n-1
        x = a + i * h
        if i % 3 == 0
            sum_3k += f(x)
        elseif i % 3 == 1
            sum_3k1 += f(x)
        else
            sum_3k2 += f(x)
        end
    end
    s += 2 * sum_3k + 3 * (sum_3k1 + sum_3k2)
    return (3 * h / 8) * s
end

# Example usage:
f(x) = x^2

a_val = 0.0
b_val = 2.0
n_val = 100
simpsons_three_eighth_result = simpsons_three_eighth_rule(f, a_val, b_val, n_val)
println("Simpson's 3/8 Rule Result: $simpsons_three_eighth_result")
