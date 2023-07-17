module module1

export TestStruct

struct TestStruct
    a::Int
    b::Int
    c::Int

    function TestStruct(a, b, c)
        @assert a <= b <= c
        new(a, b, c)
    end

end

TestStruct(a::Int; b::Int) = TestStruct(a, b, b)
TestStruct(a::Int; b::Int, c::Int) = TestStruct(a, b, c)

end  # end of module1


module module2

export TestStruct

struct TestStruct
    a::Int
    b::Int
    c::Int

    function TestStruct(a, b, c)
        @assert a <= b <= c
        new(a, b, c)
    end

end

TestStruct(a::Int; b::Int, c::Int=b) = TestStruct(a, b, c)

end  # end of module

module module3

export TestStruct

struct TestStruct
    a::Int
    b::Int
    c::Int

    function TestStruct(a, b, c)
        @assert a <= b <= c
        new(a, b, c)
    end

end

TestStruct(a::Int; b::Int, c::Int=b) = TestStruct(a, b, c)
TestStruct(a::Int; bb::Int, cc::Int, dd::Int) = TestStruct(a, bb * cc, cc * dd)

end


# using .module1  # error
using .module2 # correct
# using .module3 # error

function main()
    s1 = TestStruct(1, 2, 3)
    @assert s1.a == 1
    @assert s1.b == 2
    @assert s1.c == 3

    s2 = TestStruct(1, b=4, c=5)
    @assert s2.a == 1
    @assert s2.b == 4
    @assert s2.c == 5

    s3 = TestStruct(1, b=200.0)
    @assert s3.a == 1
    @assert s3.b == 200
    @assert s3.c == 200
end

main()