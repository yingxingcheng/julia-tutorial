
function diff_01_block()
    for i in [1,2,3, "hello"]
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

    string_aaaa = char_a ^ 4
    string_bbbb = char_b ^ 4
    string_aaaabbbb = string_aaaa * string_bbbb
    @assert string_aaaabbbb == "aaaabbbb"
    @assert string_aaaa == char_a ^ 4
end

function diff_04_lists()
    list_a = Vector{Any}()
    push!(list_a, 1)
    push!(list_a, false)
    push!(list_a, 'd')
    @assert list_a == [1, false, 'd']

    list_b = Vector{Int}()
    append!(list_b, [1,2,3])
    push!(list_b, 1)
    @assert list_b == [1, 2, 3, 1]
end


diff_01_block()
diff_02_strings()
diff_03_string_operation()
diff_04_lists()
