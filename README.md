# ApproximateInequalities.jl

Floating-point comparisons may suffer from numerical inaccuracies:

```julia
# Standard operators can be problematic
0.1 + 0.2 == 0.3    # false! 
0.1 + 0.2 ≠ 0.3     # true!
0.1 + 0.2 ≤ 0.3     # false!
0.1 + 0.2 > 0.3     # true!
```

 Julia's `≈` (`isapprox`) operator can be used to conveniently check for approximate equality:
```julia
# isapprox (built-in Julia)
0.1 + 0.2 ≈ 0.3     # true 
0.1 + 0.2 ≉ 0.3     # false 
```

This module provides approximate inequality operators that complement Julia's `≈` (`isapprox`), enabling consistent and intuitive notation for floating point comparisons:


| Operator | Tab Completion     | ASCII Alias          | Return value               |
|----------|--------------------|----------------------|----------------------------|
| `x ⪅ y`  | `\lessapprox<TAB>` | `less_or_approx`     | `(x < y) \|\| (x ≈ y)`     |
| `x ⪆ y`  | `\gtrapprox<TAB>`  | `greater_or_approx`  | `(x > y) \|\| (x ≈ y)`     |
| `x ⪉ y`  | `\lnapprox<TAB>`   | `less_not_approx`    | `(x < y) && !(x ≈ y)`      |
| `x ⪊ y`  | `\gnapprox<TAB>`   | `greater_not_approx` | `(x > y) && !(x ≈ y)`      |


## Examples

```julia
using ApproximateInequalities

# Less-than or approximately equal
0.1 + 0.2 ⪅ 0.3  # true  (approximately equal)
0.1 + 0.2 ≤ 0.3  # false (regular comparison)

# Greater-than or approximately equal  
0.3 ⪆ 0.1 + 0.2  # true  (approximately equal)
0.3 ≥ 0.1 + 0.2  # false (regular comparison)

# Less-than and not approximately equal
0.3 ⪉ 0.1 + 0.2  # false (approximately equal)
0.3 < 0.1 + 0.2  # true  (regular comparison)

# Greater-than and not approximately equal
0.1 + 0.2 ⪊ 0.3  # false (approximately equal)  
0.1 + 0.2 > 0.3  # true  (regular comparison)
```

## Tolerance options

All operators accept the same keyword arguments as `isapprox`:

```julia
# Using function call syntax for kwargs
less_or_approx(1.0, 1.1; rtol=0.2)

# Absolute tolerance
less_or_approx(1.0, 1.001; atol=0.01)
```

## Installation

```julia
using Pkg
Pkg.add("ApproximateInequalities")
```

## License

MIT License
