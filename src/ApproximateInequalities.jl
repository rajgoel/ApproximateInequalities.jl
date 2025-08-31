"""
    ApproximateInequalities

Provides comparison operators that handle approximate inequality.
  
Extends Julia's `≈` (isapprox) to inequality comparisons:
- `⪅` (\\lessapprox<TAB>): `(x < y) || (x ≈ y)`
- `⪆` (\\gtrapprox<TAB>): `(x > y) || (x ≈ y)`  
- `⪉` (\\lnapprox<TAB>): `(x < y) && !(x ≈ y)`
- `⪊` (\\gnapprox<TAB>): `(x > y) && !(x ≈ y)`

# Examples
```julia
julia> 0.1 + 0.2 ⪅ 0.3
true

julia> 0.3 ⪆ 0.1 + 0.2   
true

julia> 0.3 ⪉ 0.1 + 0.2
false

julia> 0.1 + 0.2 ⪊ 0.3
false
```
"""
module ApproximateInequalities

export less_or_approx, greater_or_approx, less_not_approx, greater_not_approx, ⪅, ⪆, ⪉, ⪊

"""
    less_or_approx(x, y; kwargs...)

Less-than or approximately equal comparison operator.
Returns `(x < y) || (x ≈ y)` (using `isapprox`).

All keyword arguments are passed to `isapprox` when checking approximate equality.
"""
function less_or_approx(x, y; kwargs...)
    return x < y || isapprox(x, y; kwargs...)
end

"""
    ⪅(x, y; kwargs...)

Less-than or approximately equal comparison operator.
Unicode alias for [`less_or_approx`](@ref). Type `\\lessapprox<TAB>` in the REPL to get the ⪅ symbol.

# Examples
```julia
julia> 0.1 + 0.2 ⪅ 0.3
true

julia> 0.1 + 0.2 ≤ 0.3
false
```
"""
const ⪅ = less_or_approx

"""
    greater_or_approx(x, y; kwargs...)

Greater-than or approximately equal comparison operator.
Returns `(x > y) || (x ≈ y)` (using `isapprox`).

All keyword arguments are passed to `isapprox` when checking approximate equality.
"""
function greater_or_approx(x, y; kwargs...)
    return x > y || isapprox(x, y; kwargs...)
end

"""
    ⪆(x, y; kwargs...)

Greater-than or approximately equal comparison operator.
Unicode alias for [`greater_or_approx`](@ref). Type `\\gtrapprox<TAB>` in the REPL to get the ⪆ symbol.


# Examples
```julia
julia> 0.3 ⪆ 0.1 + 0.2   
true

julia> 0.3 ≥ 0.1 + 0.2
false
```
"""
const ⪆ = greater_or_approx

"""
    less_not_approx(x, y; kwargs...)

Less-than and not approximately equal comparison operator.
Returns `(x < y) && !(x ≈ y)` (using `isapprox`).

All keyword arguments are passed to `isapprox` when checking approximate equality.
"""
function less_not_approx(x, y; kwargs...)
    return x < y && !isapprox(x, y; kwargs...)
end

"""
    ⪉(x, y; kwargs...)

Less-than and not approximately equal comparison operator.
Unicode alias for [`less_not_approx`](@ref). Type `\\lnapprox<TAB>` in the REPL to get the ⪉ symbol.

# Examples
```julia
julia> 0.3 ⪉ 0.1 + 0.2
false

julia> 0.3 < 0.1 + 0.2
true
```
"""
const ⪉ = less_not_approx

"""
    greater_not_approx(x, y; kwargs...)

Greater-than and not approximately equal comparison operator.
Returns `(x > y) && !(x ≈ y)` (using `isapprox`).

All keyword arguments are passed to `isapprox` when checking approximate equality.
"""
function greater_not_approx(x, y; kwargs...)
    return x > y && !isapprox(x, y; kwargs...)
end

"""
    ⪊(x, y; kwargs...)

Greater-than and not approximately equal comparison operator.
Unicode alias for [`greater_not_approx`](@ref). Type `\\gnapprox<TAB>` in the REPL to get the ⪊ symbol.

# Examples
```julia
julia> 0.1 + 0.2 ⪊ 0.3
false

julia> 0.1 + 0.2 > 0.3
true
```
"""
const ⪊ = greater_not_approx

end # module ApproximateInequalities
