function cholesky_decomposition(A)
    n = size(A, 1)
    L = zeros(n, n)

    for i in 1:n
        for j in 1:i
            if i == j
                L[i, i] = sqrt(A[i, i] - sum(L[i, 1:i-1].^2))
            else
                L[i, j] = (A[i, j] - sum(L[i, 1:j-1] .* L[j, 1:j-1])) / L[j, j]
            end
        end
    end

    return L
end

# Example usage:
A = [25.0 15.0; 15.0 18.0]
L = cholesky_decomposition(A)
println("L:")
println(L)
