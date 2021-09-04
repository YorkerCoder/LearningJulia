struct foo
    x::Int64
end

a = foo(1)
b,c = foo.([1,2])

struct foo2 <: Int64
    x::Int64
end

d = foo2(1)
