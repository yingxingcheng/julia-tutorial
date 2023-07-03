
function diff_01_block()
    for i in [1, 2, 3, "hello"]
        if typeof(i) == String
            println(i)
        else
            println(i^2)
        end
    end

    println("""`for`, `if`, `while`, etc. blocks are terminated by the `end` keyword.
            Indentation level is not significant as it in Python. Unlike Python,
            Julia has no `pass` keyword.""")
end

function diff_02_strings()
    println("""Strings are denoted by double quotation markes ("text") in Julia
            (with three quotation marks for multi-line strings), whereas in
            Python they can be denoted eigher by single ('text') or double quotation
            marks ("text"). Single quotation marks are used for characters in Julia ('c')
            """)
    println('c')
end

function diff_03_string_operation()
    char_a = 'a'
    char_b = 'b'
    string_ab = string(char_a, char_b)
    @assert string_ab == "ab"

    string_aaaa = char_a^4
    string_bbbb = char_b^4
    string_aaaabbbb = string_aaaa * string_bbbb
    @assert string_aaaabbbb == "aaaabbbb"
    @assert string_aaaa == char_a^4
end

function diff_04_lists()
    list_a = Vector{Any}()
    push!(list_a, 1)
    push!(list_a, false)
    push!(list_a, 'd')
    @assert list_a == [1, false, 'd']

    list_b = Vector{Int}()
    append!(list_b, [1, 2, 3])
    push!(list_b, 1)
    @assert list_b == [1, 2, 3, 1]
end

function diff_05_begin_indexing_of_array()
    array = Array{Int}([1, 2, 3])
    @assert array[1] == 1
    try
        first_ele = array[0]
    catch e
        @assert isa(e, BoundsError)
        println("This will raise a BoundsError!!!")
    end
end

function diff_06_indexing_of_array()
    array = Array{Int}([1, 2, 3, 6, 5])
    @assert array[1:3] == [1, 2, 3]
    @assert array[end] == 5
    @assert array[end-1] == 6

    @assert array[:4] == 6
    @assert array[1:4] == [1, 2, 3, 6]
    @assert array[1:2:5] == [1, 3, 5]
    @assert range(1, 3) == [1, 2, 3]
end

function diff_07_indexing_of_matrix()
    matrix = reshape(collect(Int, 1:25), (5, 5))
    @assert isa(matrix, Matrix)
    display(matrix)
    @assert matrix[[1, 2], [1, 3]] == [1 11; 2 12]
    @assert matrix[[CartesianIndex(1, 2), CartesianIndex(1, 3)]] == [6, 11]
    @assert matrix[CartesianIndices((1:2, 1:3))] == [1 6 11; 2 7 12]

    matrix .+= 3
    @assert matrix == reshape(collect(Int, 4:28), (5, 5))
end

function diff_08_func_arguments()
    f(x=rand()) = x

    println(f())
    println(f())
    println(f())
    println(f())
end

function diff_09_func_kwargs(; name::String, age::Int)
    println("Name: $name; Age: $age")
end

function diff_10_percent_symbol()
    @assert 7 % 3 == 1
    @assert -10 % 3 == -1 # in Python, this is -2
end

function diff_11_14_overfow_sqrt_exp_nothing()
    @assert 2^64 == 0
    @assert sqrt(Complex(-1)) == im
    @assert 2^4 == 16
    a = nothing
    @assert isnothing(a)
end

function diff_15_element_wise_product()
    A = reshape(collect(Int, 1:4), (2, 2))
    B = reshape(collect(Int, [10, 20, 30, 40]), (2, 2))
    @assert A == [1 3; 2 4]
    @assert B == [10 30; 20 40]
    @assert A * B == [70 150; 100 220]
    @assert A .* B == [10 90; 40 160]
end

function diff_16_adjoint_operator()
    array = reshape(collect(Int, 1:25), (5, 5))
    array_adj = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20; 21 22 23 24 25]
    @assert array' == array_adj
end

function diff_17_multiple_dispatch()
    function func1(a::Int, b::Int)
        return a + b
    end

    function func1(a::Int, b::Float64)
        return a * b
    end

    @assert func1(1, 2) == 3
    @assert func1(1, 2.0) == 2.0

end

@kwdef mutable struct IdentityInfo
    name::String
    age::Int
end

function change_name!(person::IdentityInfo, name::String)
    person.name = name
end

function change_age!(person::IdentityInfo, age::Int)
    if person.age == age
        println("Same age, noting to do!")
    else
        person.age = age
    end
end

function diff_18_19_struct()

    person1 = IdentityInfo(name="YingXing", age=29)
    person2 = IdentityInfo("John", 28)

    persons = [person1, person2]

    for p in persons
        println("Name: $(p.name); Age: $(p.age)")
    end

    person1.age = 18

    for p in persons
        println("Name: $(p.name); Age: $(p.age)")
    end

    change_name!(person2, "Bob")
    change_age!(person1, 18)

    for p in persons
        println("Name: $(p.name); Age: $(p.age)")
    end
end

function diff_20_ternary_operator()
    for x in range(1, 3)
        @assert (x > 0 ? 1 : -1) == 1
    end
    for x in range(-3, 0)
        @assert (x > 0 ? 1 : -1) == -1
    end
end

macro mymacro(expr)
    quote
        println("Received expression: ", $(string(expr)), " = ", $(esc(expr)) + 1)
    end
end

function diff_21_macro_usage()
    x = 4
    @mymacro(x * 2)
end

function diff_22_round()
    a = 3.7
    @assert floor(Int, 3.7) == 3 == Int(floor(3.7))
    @assert round(3.7) == 4
    @assert parse(Float64, "3.7") == 3.7
end

function diff_23_if_false()

    a = "hello"
    empty_string = ""

    if !isempty(a)
        println(""""$a" is not empty!""")
    end

    if isempty(empty_string)
        println(""" "$empty_string" is empty!""")
    end

end

function diff_24_new_scope()
    a = 10
    println("a = $a")
    println("Enter for loop...")
    for a in range(1, 5)
        println("a = $a")
    end
    println("Exit for loop...")
    println(a) # In Python, here a = 4
    @assert a == 10

end

function diff_25_try_catch_finally()
    a = 1
    b = 0

    try
        c = a / b
        @assert c == Inf
        @assert isa(c, Int)
        d = div(a, b)
    catch e
        @assert isa(e, DivideError)
    finally
        println("All is good!")
    end
end


diff_01_block()
diff_02_strings()
diff_03_string_operation()
diff_04_lists()
diff_05_begin_indexing_of_array()
diff_06_indexing_of_array()
diff_07_indexing_of_matrix()
diff_08_func_arguments()
diff_09_func_kwargs(name="YingXing", age=29)
diff_10_percent_symbol()
diff_11_14_overfow_sqrt_exp_nothing()
diff_15_element_wise_product()
diff_16_adjoint_operator()
diff_17_multiple_dispatch()
diff_18_19_struct()
diff_20_ternary_operator()
diff_21_macro_usage()
diff_22_round()
diff_23_if_false()
diff_24_new_scope()
diff_25_try_catch_finally()