
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