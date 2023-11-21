@testset "Discretizations" begin
    @info "Testing domain descriptors"
    a = 0.0
    b = 1.0
    II = 5
    N = 10

    @testset "Domain descriptors" begin
        domain_descriptors = generate_domain_and_filters(b, II, N)

        W = domain_descriptors.W
        R = domain_descriptors.R
        II = domain_descriptors.I
        N = domain_descriptors.N

        @test size(W) == (II, N)
        @test size(R) == (N, II)

        Omega = domain_descriptors.volumes.coarse
        omega = domain_descriptors.volumes.fine
        @test size(Omega) == (II, II)
        @test size(omega) == (N, N)

        # Note: I is used by LinearAlgebra to create identity matrices
        # As a temporary fix I've replaced the I used here with II
        # Eq. (18)
        @test W * R ≈ Matrix{Float64}(I, II, II)

        # two test vectors u and v
        Random.seed!(42)
        u = rand(N)
        v = rand(N)
        # filtered
        u_bar = W * u
        v_bar = W * v
        IP = domain_descriptors.inner_products.coarse
        ip = domain_descriptors.inner_products.fine
        # Eq. (A.1) (with a and b in the paper replaced by u and v here)
        @test ip(R * u_bar, R * v_bar) ≈ IP(u_bar, v_bar)

        u_prime = u - R * u_bar
        # Eq. (A.2)
        @test norm(ip(R * u_bar, u_prime)) < 1e-15

        # Eq. (A.3)
        ones_omega = ones(N)
        ones_Omega = ones(II)
        @test ip(ones_omega, u) ≈ IP(ones_Omega, u_bar)
    end
end
