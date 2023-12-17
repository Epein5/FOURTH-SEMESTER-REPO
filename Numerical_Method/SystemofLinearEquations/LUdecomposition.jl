using LinearAlgebra

function lu_decomposition(A)
    n = size(A, 1)
    L = zeros(n, n)
    U = copy(A)

    for k in 1:n-1
        for i in k+1:n
            L[i, k] = U[i, k] / U[k, k]
            for j in k:n
                U[i, j] -= L[i, k] * U[k, j]
            end
        end
    end
    L += I
    return L, U
end

# Example usage:
A = [4.0 3.0; 6.0 3.0]
L, U = lu_decomposition(A)
println("L:")
println(L)
println("U:")
println(U)
