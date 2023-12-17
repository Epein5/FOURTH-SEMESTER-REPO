function gauss_seidel_method(A, b, max_iterations=100, tolerance=1e-6)
    n = length(b)
    x = zeros(n)
    x_new = copy(x)

    for iter in 1:max_iterations
        for i in 1:n
            s = dot(A[i, 1:i-1], x_new[1:i-1]) + dot(A[i, i+1:end], x[i+1:end])
            x_new[i] = (b[i] - s) / A[i, i]
        end

        if norm(x_new - x) < tolerance
            return x_new, iter
        end

        copyto!(x, x_new)
    end

    return x_new, max_iterations
end

A = [4.0 -1.0 0.0; -1.0 4.0 -1.0; 0.0 -1.0 4.0]
b = [15.0, 10.0, 10.0]

x_gauss_seidel, iter_gauss_seidel = gauss_seidel_method(A, b)
println("Gauss-Seidel Method Solution after $iter_gauss_seidel iterations:")
println(x_gauss_seidel)
