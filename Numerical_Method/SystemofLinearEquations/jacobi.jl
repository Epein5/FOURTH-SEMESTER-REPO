function jacobi_method(A, b, max_iterations=100, tolerance=1e-6)
    n = length(b)
    x = zeros(n)
    x_new = copy(x)

    for iter in 1:max_iterations
        for i in 1:n
            s = dot(A[i, :], x) - A[i, i] * x[i]
            x_new[i] = (b[i] - s) / A[i, i]
        end

        if norm(x_new - x) < tolerance
            return x_new, iter
        end

        copyto!(x, x_new)
    end

    return x_new, max_iterations
end

# Example usage:
A = [4.0 -1.0 0.0; -1.0 4.0 -1.0; 0.0 -1.0 4.0]
b = [15.0, 10.0, 10.0]

x_jacobi, iter_jacobi = jacobi_method(A, b)
println("Jacobi Method Solution after $iter_jacobi iterations:")
println(x_jacobi)

