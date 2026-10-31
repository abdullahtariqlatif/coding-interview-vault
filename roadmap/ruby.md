# Ruby checklist

Everything Ruby that comes up in interviews, **including the basics you learned early and may not have touched in years**. Items marked **(mid)** usually separate mid-level answers from junior ones.

← Back to [ROADMAP](../ROADMAP.md) · Notes on recent versions: [refreshers/ruby.md](../refreshers/ruby.md)

---

## 1. Language basics
- [ ] What Ruby is: interpreted, dynamically typed, strongly typed, "everything is an object", MRI/CRuby vs JRuby/TruffleRuby
- [ ] `irb`, running a file, `puts` vs `print` vs `p` vs `pp` (and that `puts` returns `nil`)
- [ ] Comments, `=begin` / `=end`, the `# frozen_string_literal: true` magic comment
- [ ] Naming conventions: `snake_case` methods and variables, `CamelCase` classes, `SCREAMING_CASE` constants
- [ ] Method name suffixes: `?` (predicates), `!` (dangerous or mutating), `=` (setters)
- [ ] Variable kinds: local, `@instance`, `@@class`, `$global`, `CONSTANT` (reassigning only warns)
- [ ] Scope gates: `def`, `class` and `module` start a new scope; blocks don't
- [ ] **Truthiness**: only `nil` and `false` are falsy. `0`, `""` and `[]` are truthy
- [ ] Everything returns a value: `if`, `case` and method bodies (implicit return)
- [ ] Parallel assignment and swapping: `a, b = b, a`; splat in assignment: `first, *rest = arr`

## 2. Numbers
- [ ] `Integer`, `Float`, `Rational`, `Complex`, `BigDecimal` (use it, or integer cents, for money)
- [ ] Integer division: `7 / 2 => 3`, `7.0 / 2`, `fdiv`, `divmod`, `%`, `**`
- [ ] Float precision: `0.1 + 0.2 != 0.3`
- [ ] `round(2)`, `floor`, `ceil`, `abs`, `even?`, `odd?`, `zero?`, `positive?`, `digits`, `to_s(2)` (binary), `Integer("2", 2)`
- [ ] `"12".to_i` (lenient) vs `Integer("12")` (raises on bad input); `to_f`, `to_r`
- [ ] Iterating with numbers: `times`, `upto`, `downto`, `step`

## 3. Strings
- [ ] Single vs double quotes, interpolation `"#{x}"`, escape characters
- [ ] Heredocs: `<<~SQL`; percent literals: `%w[]`, `%i[]`, `%q()`, `%Q()`
- [ ] Mutation: `<<` changes the string in place, `+` creates a new one; `+=` reassigns the variable
- [ ] Common methods: `length`, `upcase`, `downcase`, `capitalize`, `swapcase`, `strip`, `chomp`, `chop`, `split`, `chars`, `bytes`, `lines`, `reverse`, `include?`, `start_with?`, `end_with?`, `index`, `count`, `delete`, `squeeze`, `center`, `ljust`, `rjust`, `*`, `slice` / `[]` with ranges, `tr`, `succ`, `ord`, `chr`, `each_char`
- [ ] `sub` vs `gsub` (with a hash or a block), `scan`, `match`, `=~`, `match?`
- [ ] Formatting: `format` / `%`, e.g. `"%.2f" % 3.14159`
- [ ] Frozen strings: `freeze`, `frozen?`, `dup` to unfreeze, chilled strings (3.4)
- [ ] Encoding basics: `encoding`, `force_encoding`, UTF-8

## 4. Symbols
- [ ] Symbol vs String: immutable, one object per name (same `object_id`), used for hash keys and identifiers
- [ ] `to_sym` / `to_s`, `Symbol#to_proc` (`map(&:upcase)`), and how it works

## 5. Arrays
- [ ] Creating: literal, `Array.new(3)`, `Array.new(3) { [] }` vs the **`Array.new(3, [])` shared-object trap**, `%w`, `Array(x)`, `(1..5).to_a`
- [ ] Access: `[]`, negative indexes, `[start, length]`, ranges, `first(n)`, `last(n)`, `take`, `drop`, `dig`, `fetch`, `sample`, `values_at`
- [ ] Adding and removing: `push` / `<<`, `pop`, `shift`, `unshift`, `insert`, `delete`, `delete_at`, `delete_if`, `compact`, `clear`, `concat`
- [ ] Transforming: `map`, `flatten`, `uniq`, `sort`, `sort_by`, `reverse`, `rotate`, `shuffle`, `transpose`, `zip`, `product`, `combination`, `permutation`, `each_slice`, `join`, `fill`
- [ ] Set operations: `&`, `|`, `-`, `+`, `*` (with an integer or a string)
- [ ] Searching: `include?`, `index`, `find_index`, `count`, `bsearch`
- [ ] Mutating vs non-mutating versions (`sort` vs `sort!`), and `!` methods returning `nil` when nothing changed
- [ ] Destructuring in block params: `pairs.each { |(a, b)| }`

## 6. Hashes
- [ ] Syntax: `{ "a" => 1 }`, `{ a: 1 }`, shorthand `{ a:, b: }` (3.1); symbol vs string keys
- [ ] Insertion order is preserved
- [ ] Default values: `Hash.new(0)`, `Hash.new { |h, k| h[k] = [] }` vs the **`Hash.new([])` shared-default trap**
- [ ] `[]` (returns `nil`) vs `fetch` (raises, or takes a default or block); `dig` for nested hashes
- [ ] `key?` / `include?`, `value?`, `keys`, `values`, `size`, `empty?`, `delete`, `to_a`, `invert`, `key`
- [ ] Iterating: `each` / `each_pair`, `each_key`, `each_value`, `each_with_index`
- [ ] Transforming: `map` (returns an array), `to_h`, `to_h { |k, v| }`, `transform_values`, `transform_keys`, `filter_map`, `select` / `reject` (return hashes), `min_by`, `max_by`, `sort_by`, `sum`, `group_by`, `partition`, `find`, `count`, `any?`
- [ ] `merge` (with a block for conflicts), `merge!` / `update`, `slice`, `except`, `compact`, `filter_map`
- [ ] Mutable objects as keys, and why `eql?` and `hash` matter
- [ ] In Rails: `with_indifferent_access`, `symbolize_keys`, `deep_merge`, `deep_symbolize_keys`

## 7. Ranges and other collections
- [ ] `1..5` (inclusive) vs `1...5` (exclusive), endless `1..` and beginless `..5`, `step`, `to_a`, `cover?` vs `include?`, character ranges `'a'..'z'`
- [ ] `Set` (`require "set"` before 3.2): `add`, `include?`, `|`, `&`, `-`, `subset?`
- [ ] `Struct` vs `OpenStruct` (slow; avoid it) vs `Data` (3.2, immutable)

## 8. Control flow
- [ ] `if` / `elsif` / `else`, `unless`, the ternary operator, modifier forms (`return if x`)
- [ ] `case` / `when` (uses `===`, so it works with classes, ranges, regexes and lambdas); `case` / `in` pattern matching
- [ ] Loops: `while`, `until`, `loop do`, `for` (its variable leaks out of the loop, which is why Ruby code avoids it), `begin ... end while`
- [ ] `next`, `break` (can return a value), `redo`; `catch` / `throw` for breaking out of nested loops
- [ ] `&&` / `||` vs `and` / `or` (**precedence difference**), `!` vs `not`
- [ ] `||=` (memoization) and its problem with `false` / `nil` values; `&&=`
- [ ] Safe navigation `&.` vs `try` (Rails)
- [ ] The spaceship operator `<=>`; `between?`, `clamp`

## 9. Methods
- [ ] Defining methods, implicit return, explicit `return` (and returning several values as an array)
- [ ] Arguments: required, default (`b = 2`), keyword (`name:`, `age: 18`), splat `*args`, double splat `**opts`, block `&blk`, and their order
- [ ] Argument forwarding: `...`, anonymous `*`, `**`, `&`
- [ ] Ruby passes object references by value: mutating an argument inside a method affects the caller's object, but reassigning the parameter doesn't
- [ ] Endless methods: `def sq(x) = x * x`
- [ ] Operator methods: `+`, `-`, `==`, `[]`, `[]=`, `<<`, `<=>`, unary `-@`, `to_s`, `inspect`, `to_proc`, `coerce`
- [ ] `alias` vs `alias_method`, `undef_method` vs `remove_method`
- [ ] `defined?`, `respond_to?`, `method(:name)` (Method objects), `public_send` vs `send`
- [ ] Implicit vs explicit conversions: `to_s` vs `to_str`, `to_a` vs `to_ary`, `Array()`, `String()`, `Integer()`

## 10. Blocks, procs and lambdas
- [ ] Block syntax `{ }` vs `do end` (precedence difference), block parameters, block-local variables
- [ ] `yield`, `yield` with arguments, `block_given?`, receiving a block as `&block`, passing it on
- [ ] Proc vs lambda: argument checking, how `return` behaves, `lambda?`
- [ ] Ways to call: `.call`, `.()`, `[]`, `yield`
- [ ] Closures: blocks capture the surrounding variables
- [ ] `&` to convert a method or symbol into a proc: `map(&:to_s)`, `map(&method(:puts))`
- [ ] Currying (`curry`), composition (`>>`, `<<`) **(mid)**

## 11. Enumerable and Enumerator
- [ ] Iteration: `each`, `each_with_index`, `each.with_index(1)`, `map.with_index`, `each_with_object`, `each_slice`, `each_cons`, `cycle`
- [ ] Transforming: `map` / `collect`, `flat_map`, `filter_map`, `zip`, `tally`, `uniq`, `sort` / `sort_by`, `group_by`, `partition`, `chunk_while`, `slice_when`, `each_entry`
- [ ] Filtering: `select` / `filter`, `reject`, `find` / `detect`, `find_all`, `grep`, `take_while`, `drop_while`, `first`, `min` / `max` / `minmax` / `min_by` / `max_by`
- [ ] Reducing: `reduce` / `inject` (with a symbol or a block), `sum`, `count`
- [ ] Predicates: `any?`, `all?`, `none?`, `one?`, `include?` / `member?`; predicates with a pattern argument `any?(Integer)`
- [ ] Including `Enumerable` in your own class by defining `each`
- [ ] Enumerators: calling `each` without a block, `next` (external iteration), `Enumerator.new`, `lazy` for large or infinite sequences **(mid)**

## 12. Object-oriented Ruby
- [ ] `class`, `initialize`, `new`, instance variables, `attr_reader` / `attr_writer` / `attr_accessor`
- [ ] `self` in each context: inside an instance method, at class level, inside `class << self`
- [ ] Class methods: `def self.x`, `class << self`; class variables vs class instance variables
- [ ] Inheritance with `<`, overriding methods, `super` vs `super()` vs `super(a)`, `Object` and `BasicObject`
- [ ] Introspection: `class`, `superclass`, `ancestors`, `instance_of?` vs `is_a?` / `kind_of?`, `instance_variables`, `methods`, `respond_to?`
- [ ] Visibility: `public`, `private`, `protected` (with an example), `private attr_reader`, `private_constant`, `private_class_method`
- [ ] Defining `to_s`, `inspect`, `==`, `eql?` + `hash`, and `<=>` with `Comparable`
- [ ] Duck typing, and polymorphism without interfaces
- [ ] Open classes / monkey patching (and the risks), refinements **(mid)**
- [ ] Singleton methods and the singleton class (eigenclass) **(mid)**
- [ ] `Object#freeze`, `frozen?`, value objects

## 13. Modules
- [ ] Modules as namespaces (`Admin::User`), the `::` operator, constant lookup
- [ ] Mixins: `include` (instance methods), `extend` (class or singleton methods), `prepend` (wrapping)
- [ ] Method lookup order: singleton → prepended modules → class → included modules (last included first) → superclass … → `method_missing`
- [ ] `module_function`, `extend self`
- [ ] Hook methods: `included`, `extended`, `prepended`, `inherited` **(mid)**
- [ ] `Comparable` and `Enumerable` as built-in mixins
- [ ] Module vs class: modules can't be instantiated or inherited from

## 14. Object model and memory
- [ ] `object_id`, `==` / `eql?` / `equal?` / `===`
- [ ] `dup` vs `clone` (frozen state, singleton methods); shallow vs deep copy
- [ ] Mutability problems: shared default arguments and constants that get mutated
- [ ] Garbage collection basics; symbols are now garbage collected **(mid)**
- [ ] YJIT, and what a JIT compiler does **(mid)**

## 15. Exceptions
- [ ] `begin` / `rescue` / `else` / `ensure` / `retry`; method-level `rescue`; inline `rescue` (avoid it)
- [ ] The exception hierarchy: `Exception` → `StandardError` → `RuntimeError`, `ArgumentError`, `NameError` → `NoMethodError`, `TypeError`, `ZeroDivisionError`, `KeyError`, `IOError`
- [ ] Why you rescue `StandardError` and not `Exception`
- [ ] `raise "msg"`, `raise MyError, "msg"`, re-raising, `e.message`, `e.backtrace`, `e.full_message`, `cause`
- [ ] Custom error classes with extra data
- [ ] `ensure` vs `else`, and the order they run in

## 16. Metaprogramming **(mid)**
- [ ] `send` / `public_send`, `define_method`, `method_missing` + `respond_to_missing?`
- [ ] `instance_variable_get` / `instance_variable_set`, `const_get`, `class_eval` / `instance_eval` / `instance_exec`
- [ ] `define_singleton_method`, `Class.new`, `Module.new`
- [ ] How Rails uses these (`has_many`, attribute methods, `delegate`), and when not to use them

## 17. Files, I/O and the standard library
- [ ] `File.read`, `File.write`, `File.open` with a block (closes the file automatically), `File.foreach`, `each_line`, file modes
- [ ] `gets`, `STDIN` / `$stdin`, `ARGV`, `exit`, `__FILE__`, `__dir__`
- [ ] `require` vs `require_relative` vs `load`
- [ ] Libraries to know: `JSON` (`parse`, `generate`, `to_json`), `CSV`, `Time` / `Date` / `DateTime`, `Set`, `Benchmark`, `SecureRandom`, `Digest`, `Logger`, `Net::HTTP`, `URI`, `ERB`, `YAML`
- [ ] Regex basics: character classes, anchors (`\A`, `\z` vs `^`, `$`, a common source of security bugs), groups, named captures, `$~`, `$1`

## 18. Gems and tooling
- [ ] RubyGems vs Bundler; `Gemfile`, `Gemfile.lock`, `bundle install` vs `bundle update`, `bundle exec`
- [ ] Version constraints: `~> 2.1`, `>=`; why the lock file is committed for apps
- [ ] Version managers (rbenv, rvm, asdf, mise) and `.ruby-version`
- [ ] Creating a gem (gemspec) **(mid)**
- [ ] RuboCop, Standard; the debuggers: `debug` (`binding.irb`, `debugger`), pry, byebug

## 19. Concurrency **(mid)**
- [ ] `Thread`, `Mutex`, `Queue`, `ConditionVariable`, race conditions
- [ ] The GVL (GIL): why threads help with I/O-bound work but not CPU-bound work
- [ ] Processes (`fork`), Fibers, the fiber scheduler, Ractors
- [ ] How Puma (threads plus workers) and Sidekiq (threads) use these

## 20. Recent versions
- [ ] 2.x highlights you're still expected to know: keyword arguments (2.0), safe navigation `&.` (2.3), frozen string literal comment, `then` / `yield_self`, `filter_map` (2.7), numbered block params `_1` (2.7)
- [ ] 3.x: keyword argument separation (3.0), pattern matching, endless methods, Ractors, RBS, hash shorthand, YJIT, `Data`, Prism, `it`, the new `Hash#inspect` format ([refreshers/ruby.md](../refreshers/ruby.md))

## 21. Ruby output puzzles interviewers like
- [ ] `a = "hi"; b = a; b << "!"` — what is `a`?
- [ ] `[1, 2, 3].each { |x| x * 2 }` — what does it return?
- [ ] `Hash.new([])` then `h[:a] << 1; h[:b]` — what is `h[:b]`?
- [ ] `x = 5 and false` — what is `x`?
- [ ] `nil.to_a`, `nil.to_s`, `nil.to_i`; `[nil, false].compact`
- [ ] `def m; return 1, 2; end` — what is `m`?
- [ ] `proc { return 1 }.call` at the top level vs inside a method
