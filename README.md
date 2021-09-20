# Note: This is not a final version, the project is still in progress. Will be ready soon!
# Newton's-approximation-method
In numerical analysis, Newton's method, is a root-finding algorithm which produces successively better approximations to the roots (or zeroes) of a real-valued function. The most basic version starts with a single-variable function `f` defined for a real variable `x`, the function's derivative `f′`, and an initial guess `x0` for a root of `f`. If the function satisfies sufficient assumptions and the initial guess is close, then

![](https://bit.ly/3hPouLe)

is a better approximation of the root than `x0`. Geometrically, `(x1, 0)` is the intersection of the x-axis and the tangent of the graph of `f` at `(x0, f (x0))`: that is, the improved guess is the unique root of the linear approximation at the initial point. The process is repeated as

![](https://bit.ly/3hP3pR3)

until a sufficiently precise value is reached.

# To run the script:
```sh
cd app/bin && ruby main.rb
```