# Ruby refresher: what's new since Ruby 3.0

Check your version with `ruby -v`. Use `irb` to try things out.

## Syntax worth knowing

```ruby
# Endless method (3.0)
def square(x) = x * x

# Hash shorthand (3.1): picks up local variables with the same names
name, age = "Ali", 30
user = { name:, age: }            # => {name: "Ali", age: 30}

# `it`: implicit block parameter (3.4)
[1, 2, 3].map { it * 2 }          # => [2, 4, 6]
[1, 2, 3].map { _1 * 2 }          # numbered params (2.7+) still work

# Anonymous argument forwarding (3.1 / 3.2)
def log(*, **, &) = puts(*, **, &)
def wrap(...) = target(...)
```

## Pattern matching (`case`/`in`, stable since 3.0)

```ruby
case { status: "ok", data: { user: { name: "Ali", role: "admin" } } }
in { status: "ok", data: { user: { name: String => name, role: "admin" } } }
  puts "Admin: #{name}"
in { status: "error", message: }
  puts message
end

config = { db: { user: "admin", port: 5432 } }
config => { db: { port: } }       # rightward pattern: binds port = 5432 (raises if no match)
config in { db: { user: String } } # => true/false

case [1, 42, "x", 99]
in [*, String => s, *]            # find pattern
  puts "found #{s}"
end
```

## Value objects with `Data` (3.2)

```ruby
Point = Data.define(:x, :y) do
  def +(other) = with(x: x + other.x, y: y + other.y)
end
p1 = Point.new(x: 1, y: 2)        # immutable, has ==, to_h, with
p1.with(y: 5)                     # => #<data Point x=1, y=5>
```

## Other changes

- **YJIT** (3.1+): a JIT compiler, production ready since 3.2. Rails 7.2+ turns it on by default.
- **Prism** (3.4): the default parser. Error messages are clearer.
- **Chilled strings** (3.4): string literals warn when mutated if `--enable-frozen-string-literal` warnings are on. They'll become frozen in a future version.
- **`Hash#inspect`** (3.4): now prints `{name: "Ali"}` instead of `{:name=>"Ali"}`.
- **Ractors**: actor-style parallelism. Know what they are; they're rarely used in apps.
- **RBS / Steep / Sorbet**: optional type signatures.
- **Ruby 4.0** (Dec 2025): skim the release notes if the job uses it.

## Classic interview questions

- `proc` vs `lambda`: arity checks, and what `return` does inside each
- `include` vs `extend` vs `prepend`, and how method lookup (`ancestors`) works
- `==`, `eql?`, `equal?`, `===`
- Symbols vs strings; `freeze` and the frozen string literal comment
- `method_missing` + `respond_to_missing?`, `define_method`, `send` vs `public_send`
- `Comparable` and `Enumerable`: implement `<=>` or `each` and get many methods for free
- The GIL/GVL and threads vs processes vs Ractors
