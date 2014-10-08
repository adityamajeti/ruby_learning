ary = [1, "two", 3.0] #=> [1, "two", 3.0]

ary = Array.new    #=> []
Array.new(3)       #=> [nil, nil, nil]
Array.new(3, true) #=> [true, true, true]

Array.new(4) { Hash.new } #=> [{}, {}, {}, {}]

empty_table = Array.new(3) { Array.new(3) }
#=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]

Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]

arr = [1, 2, 3, 4, 5, 6]
arr[2]    #=> 3
arr[100]  #=> nil
arr[-3]   #=> 4
arr[2, 3] #=> [3, 4, 5]
arr[1..4] #=> [2, 3, 4, 5]
arr[1..-3] #=> [2, 3, 4]

arr.at(0) #=> 1

arr = ['a', 'b', 'c', 'd', 'e', 'f']
arr.fetch(100) #=> IndexError: index 100 outside of array bounds: -6...6
arr.fetch(100, "oops") #=> "oops"

arr.first #=> 1
arr.last  #=> 6

arr.take(3) #=> [1, 2, 3]

arr.drop(3) #=> [4, 5, 6]

browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
browsers.length #=> 5
browsers.count #=> 5

browsers.empty? #=> false

browsers.include?('Konqueror') #=> false

arr = [1, 2, 3, 4]
arr.push(5) #=> [1, 2, 3, 4, 5]
arr << 6    #=> [1, 2, 3, 4, 5, 6]

arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6]

arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]

arr.insert(3, 'orange', 'pear', 'grapefruit')#=> [0, 1, 2, "orange", "pear", "grapefruit", "apple", 3, 4, 5, 6]

arr =  [1, 2, 3, 4, 5, 6]
arr.pop #=> 6
arr #=> [1, 2, 3, 4, 5]

arr.shift #=> 1
arr #=> [2, 3, 4, 5]

arr.delete_at(2) #=> 4
arr #=> [2, 3, 5]

arr = [1, 2, 2, 3]
arr.delete(2) #=> 2
arr #=> [1,3]

arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']

arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]

arr = [1, 2, 3, 4, 5]
arr.each { |a| print a -= 10, " " }
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]

words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each { |word| str += "#{word} " }
p str #=> "sixth fifth fourth third second first "

arr.map { |a| 2*a }   #=> [2, 4, 6, 8, 10]
arr                   #=> [1, 2, 3, 4, 5]
arr.map! { |a| a**2 } #=> [1, 4, 9, 16, 25]
arr                   #=> [1, 4, 9, 16, 25]

arr = [1, 2, 3, 4, 5, 6]
arr.select { |a| a > 3 }     #=> [4, 5, 6]
arr.reject { |a| a < 3 }     #=> [3, 4, 5, 6]
arr.drop_while { |a| a < 4 } #=> [4, 5, 6]
arr                          #=> [1, 2, 3, 4, 5, 6]

arr.delete_if { |a| a < 4 } #=> [4, 5, 6]
arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
arr.keep_if { |a| a < 4 } #=> [1, 2, 3]
arr                       #=> [1, 2, 3]

Public Class Methods
[](*args)

Returns a new array populated with the given objects.

Array.[]( 1, 'a', /^A/ ) # => [1, "a", /^A/]
Array[ 1, 'a', /^A/ ]    # => [1, "a", /^A/]
[ 1, 'a', /^A/ ]         # => [1, "a", /^A/]

new(size=0, obj=nil)
new(array)
new(size) {|index| block }

Returns a new array.


first_array = ["Matz", "Guido"]

second_array = Array.new(first_array) #=> ["Matz", "Guido"]

first_array.equal? second_array       #=> false

Array.new(3){ |index| index ** 2 }# => [0, 1, 4]

a = Array.new(2, Hash.new)# => [{}, {}]

a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {"cat"=>"feline"}]

a[1]['cat'] = 'Felix'
a # => [{"cat"=>"Felix"}, {"cat"=>"Felix"}]

a = Array.new(2) { Hash.new }
a[0]['cat'] = 'feline'
a # => [{"cat"=>"feline"}, {}]

try_convert(obj) → array or nil

Array.try_convert([1])   #=> [1]
Array.try_convert("1")   #=> nil

if tmp = Array.try_convert(arg)
  # the argument is an array
elsif tmp = String.try_convert(arg)
  # the argument is a string
end

Public Instance Methods
ary & other_ary → new_ary

[ 1, 1, 3, 5 ] & [ 1, 2, 3 ]                 #=> [ 1, 3 ]
[ 'a', 'b', 'b', 'z' ] & [ 'a', 'b', 'c' ]   #=> [ 'a', 'b' ]

See also #uniq.
ary * int → new_ary
ary * str → new_string

[ 1, 2, 3 ] * 3    #=> [ 1, 2, 3, 1, 2, 3, 1, 2, 3 ]
[ 1, 2, 3 ] * ","  #=> "1,2,3"

ary + other_ary → new_ary

[ 1, 2, 3 ] + [ 4, 5 ]    #=> [ 1, 2, 3, 4, 5 ]
a = [ "a", "b", "c" ]
c = a + [ "d", "e", "f" ]
c                         #=> [ "a", "b", "c", "d", "e", "f" ]
a                         #=> [ "a", "b", "c" ]

See also #concat.
ary - other_ary → new_ary

[ 1, 1, 2, 2, 3, 3, 4, 5 ] - [ 1, 2, 4 ]  #=>  [ 3, 3, 5 ]

[ 1, 2 ] << "c" << "d" << [ 3, 4 ]
        #=>  [ 1, 2, "c", "d", [ 3, 4 ] ]

ary <=> other_ary → -1, 0, +1 or nil

[ "a", "a", "c" ]    <=> [ "a", "b", "c" ]   #=> -1
[ 1, 2, 3, 4, 5, 6 ] <=> [ 1, 2 ]            #=> +1

ary == other_ary → bool

[ "a", "c" ]    == [ "a", "c", 7 ]     #=> false
[ "a", "c", 7 ] == [ "a", "c", 7 ]     #=> true
[ "a", "c", 7 ] == [ "a", "d", "f" ]   #=> false

ary[index] → obj or nil
ary[start, length] → new_ary or nil
ary[range] → new_ary or nil
slice(index) → obj or nil
slice(start, length) → new_ary or nil
slice(range) → new_ary or nil


a = [ "a", "b", "c", "d", "e" ]
a[2] +  a[0] + a[1]    #=> "cab"
a[6]                   #=> nil
a[1, 2]                #=> [ "b", "c" ]
a[1..3]                #=> [ "b", "c", "d" ]
a[4..7]                #=> [ "e" ]
a[6..10]               #=> nil
a[-3, 3]               #=> [ "c", "d", "e" ]
# special cases
a[5]                   #=> nil
a[6, 1]                #=> nil
a[5, 1]                #=> []
a[5..10]               #=> []

ary[index] = obj → obj
ary[start, length] = obj or other_ary or nil → obj or other_ary or nil
ary[range] = obj or other_ary or nil → obj or other_ary or nil

Element Assignment — Sets the element at index, or replaces a subarray from the start index for length elements, or replaces a subarray specified by the range of indices.

If indices are greater than the current capacity of the array, the array grows automatically. Elements are inserted into the array at start if length is zero.

Negative indices will count backward from the end of the array. For start and range cases the starting index is just before an element.

An IndexError is raised if a negative index points past the beginning of the array.

See also #push, and #unshift.

a = Array.new
a[4] = "4";                 #=> [nil, nil, nil, nil, "4"]
a[0, 3] = [ 'a', 'b', 'c' ] #=> ["a", "b", "c", nil, "4"]
a[1..2] = [ 1, 2 ]          #=> ["a", 1, 2, nil, "4"]
a[0, 2] = "?"               #=> ["?", 2, nil, "4"]
a[0..2] = "A"               #=> ["A", "4"]
a[-1]   = "Z"               #=> ["A", "Z"]
a[1..-1] = nil              #=> ["A", nil]
a[1..-1] = []               #=> ["A"]
a[0, 0] = [ 1, 2 ]          #=> [1, 2, "A"]
a[3, 0] = "B"               #=> [1, 2, "A", "B"]

assoc(obj) → new_ary or nil

See also #rassoc

s1 = [ "colors", "red", "blue", "green" ]
s2 = [ "letters", "a", "b", "c" ]
s3 = "foo"
a  = [ s1, s2, s3 ]
a.assoc("letters")  #=> [ "letters", "a", "b", "c" ]
a.assoc("foo")      #=> nil

at(index) → obj or nil

a = [ "a", "b", "c", "d", "e" ]
a.at(0)     #=> "a"
a.at(-1)    #=> "e"

bsearch {|x| block } → elem

ary = [0, 4, 7, 10, 12]
ary.bsearch {|x| x >=   4 } #=> 4
ary.bsearch {|x| x >=   6 } #=> 7
ary.bsearch {|x| x >=  -1 } #=> 0
ary.bsearch {|x| x >= 100 } #=> nil

ary = [0, 4, 7, 10, 12]
# try to find v such that 4 <= v < 8
ary.bsearch {|x| 1 - x / 4 } #=> 4 or 7
# try to find v such that 8 <= v < 10
ary.bsearch {|x| 4 - x / 2 } #=> nil

a = [ "a", "b", "c", "d", "e" ]
a.clear    #=> [ ]

collect { |item| block } → new_ary
collect → Enumerator

a = [ "a", "b", "c", "d" ]
a.collect { |x| x + "!" }        #=> ["a!", "b!", "c!", "d!"]
a.map.with_index{ |x, i| x * i } #=> ["", "b", "cc", "ddd"]
a                                #=> ["a", "b", "c", "d"]

collect! {|item| block } → ary
collect! → Enumerator

a = [ "a", "b", "c", "d" ]
a.map! {|x| x + "!" }
a #=>  [ "a!", "b!", "c!", "d!" ]
a.collect!.with_index {|x, i| x[0...i] }
a #=>  ["", "b", "c!", "d!"]

combination(n) { |c| block } → ary
combination(n) → Enumerator

Examples:

a = [1, 2, 3, 4]
a.combination(1).to_a  #=> [[1],[2],[3],[4]]
a.combination(2).to_a  #=> [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
a.combination(3).to_a  #=> [[1,2,3],[1,2,4],[1,3,4],[2,3,4]]
a.combination(4).to_a  #=> [[1,2,3,4]]
a.combination(0).to_a  #=> [[]] # one combination of length 0
a.combination(5).to_a  #=> []   # no combinations of length 5

compact → new_ary

[ "a", nil, "b", nil, "c", nil ].compact
                  #=> [ "a", "b", "c" ]

compact! → ary or nil

[ "a", nil, "b", nil, "c" ].compact! #=> [ "a", "b", "c" ]
[ "a", "b", "c" ].compact!           #=> nil

concat(other_ary) → ary

[ "a", "b" ].concat( ["c", "d"] ) #=> [ "a", "b", "c", "d" ]
a = [ 1, 2, 3 ]
a.concat( [ 4, 5 ] )
a                                 #=> [ 1, 2, 3, 4, 5 ]

See also Array#+.
count → int
count(obj) → int
count { |item| block } → int

ary = [1, 2, 4, 2]
ary.count                  #=> 4
ary.count(2)               #=> 2
ary.count { |x| x%2 == 0 } #=> 3

cycle(n=nil) { |obj| block } → nil
cycle(n=nil) → Enumerator

a = ["a", "b", "c"]
a.cycle { |x| puts x }     # print, a, b, c, a, b, c,.. forever.
a.cycle(2) { |x| puts x }  # print, a, b, c, a, b, c.

delete(obj) → item or nil
delete(obj) { block } → item or result of block

a = [ "a", "b", "b", "b", "c" ]
a.delete("b")                   #=> "b"
a                               #=> ["a", "c"]
a.delete("z")                   #=> nil
a.delete("z") { "not found" }   #=> "not found"

delete_at(index) → obj or nil

a = ["ant", "bat", "cat", "dog"]
a.delete_at(2)    #=> "cat"
a                 #=> ["ant", "bat", "dog"]
a.delete_at(99)   #=> nil

delete_if { |item| block } → ary
delete_if → Enumerator

Deletes every element of self for which block evaluates to true.

The array is changed instantly every time the block is called, not after the iteration is over.

See also #reject!

If no block is given, an Enumerator is returned instead.

scores = [ 97, 42, 75 ]
scores.delete_if {|score| score < 80 }   #=> [97]

drop(n) → new_ary

a = [1, 2, 3, 4, 5, 0]
a.drop(3)             #=> [4, 5, 0]

drop_while { |arr| block } → new_ary
drop_while → Enumerator

a = [1, 2, 3, 4, 5, 0]
a.drop_while {|i| i < 3 }   #=> [3, 4, 5, 0]

each { |item| block } → ary
each → Enumerator

a = [ "a", "b", "c" ]
a.each {|x| print x, " -- " }

produces:

a -- b -- c --

each_index { |index| block } → ary
each_index → Enumerator

a = [ "a", "b", "c" ]
a.each_index {|x| print x, " -- " }

produces:

0 -- 1 -- 2 --

empty? → true or false

Returns true if self contains no elements.

[].empty?   #=> true

eql?(other) → true or false

Returns true if self and other are the same object, or are both arrays with the same content (according to Object#eql?).
fetch(index) → obj
fetch(index, default) → obj
fetch(index) { |index| block } → obj

a = [ 11, 22, 33, 44 ]
a.fetch(1)               #=> 22
a.fetch(-1)              #=> 44
a.fetch(4, 'cat')        #=> "cat"
a.fetch(100) { |i| puts "#{i} is out of bounds" }
                         #=> "100 is out of bounds"

fill(obj) → ary
fill(obj, start [, length]) → ary
fill(obj, range ) → ary
fill { |index| block } → ary
fill(start [, length] ) { |index| block } → ary
fill(range) { |index| block } → ary

a = [ "a", "b", "c", "d" ]
a.fill("x")              #=> ["x", "x", "x", "x"]
a.fill("z", 2, 2)        #=> ["x", "x", "z", "z"]
a.fill("y", 0..1)        #=> ["y", "y", "z", "z"]
a.fill { |i| i*i }       #=> [0, 1, 4, 9]
a.fill(-2) { |i| i*i*i } #=> [0, 1, 8, 27]

find_index(obj) → int or nil
find_index { |item| block } → int or nil
find_index → Enumerator

a = [ "a", "b", "c" ]
a.index("b")              #=> 1
a.index("z")              #=> nil
a.index { |x| x == "b" }  #=> 1

first → obj or nil
first(n) → new_ary

a = [ "q", "r", "s", "t" ]
a.first     #=> "q"
a.first(2)  #=> ["q", "r"]

flatten → new_ary
flatten(level) → new_ary

s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]

flatten! → ary or nil
flatten!(level) → ary or nil

a = [ 1, 2, [3, [4, 5] ] ]
a.flatten!   #=> [1, 2, 3, 4, 5]
a.flatten!   #=> nil
a            #=> [1, 2, 3, 4, 5]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten!(1) #=> [1, 2, 3, [4, 5]]

frozen? → true or false

a = [ "a", "b", "c" ]
a.include?("b")   #=> true
a.include?("z")   #=> false

index(obj) → int or nil
index { |item| block } → int or nil
index → Enumerator

a = [ "a", "b", "c" ]
a.index("b")              #=> 1
a.index("z")              #=> nil
a.index { |x| x == "b" }  #=> 1

initialize_copy(other_ary) → ary

a = [ "a", "b", "c", "d", "e" ]
a.replace([ "x", "y", "z" ])   #=> ["x", "y", "z"]
a                              #=> ["x", "y", "z"]

insert(index, obj...) → ary

a = %w{ a b c d }
a.insert(2, 99)         #=> ["a", "b", 99, "c", "d"]
a.insert(-2, 1, 2, 3)   #=> ["a", "b", 99, "c", 1, 2, 3, "d"]

inspect → string
to_s → string

[ "a", "b", "c" ].to_s     #=> "[\"a\", \"b\", \"c\"]"

Also aliased as: to_s
join(separator=$,) → str

[ "a", "b", "c" ].join        #=> "abc"
[ "a", "b", "c" ].join("-")   #=> "a-b-c"

keep_if { |item| block } → ary
keep_if → Enumerator

a = %w{ a b c d e f }
a.keep_if { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]

last → obj or nil
last(n) → new_ary

a = [ "w", "x", "y", "z" ]
a.last     #=> "z"
a.last(2)  #=> ["y", "z"]

length → int


[ 1, 2, 3, 4, 5 ].length   #=> 5
[].length                  #=> 0

Also aliased as: size
map { |item| block } → new_ary
map → Enumerator

a = [ "a", "b", "c", "d" ]
a.collect { |x| x + "!" }        #=> ["a!", "b!", "c!", "d!"]
a.map.with_index{ |x, i| x * i } #=> ["", "b", "cc", "ddd"]
a                                #=> ["a", "b", "c", "d"]

map! {|item| block } → ary
map! → Enumerator

a = [ "a", "b", "c", "d" ]
a.map! {|x| x + "!" }
a #=>  [ "a!", "b!", "c!", "d!" ]
a.collect!.with_index {|x, i| x[0...i] }
a #=>  ["", "b", "c!", "d!"]

permutation { |p| block } → ary
permutation → Enumerator
permutation(n) { |p| block } → ary
permutation(n) → Enumerator

Examples:

a = [1, 2, 3]
a.permutation.to_a    #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(1).to_a #=> [[1],[2],[3]]
a.permutation(2).to_a #=> [[1,2],[1,3],[2,1],[2,3],[3,1],[3,2]]
a.permutation(3).to_a #=> [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
a.permutation(0).to_a #=> [[]] # one permutation of length 0
a.permutation(4).to_a #=> []   # no permutations of length 4

pop → obj or nil
pop(n) → new_ary

a = [ "a", "b", "c", "d" ]
a.pop     #=> "d"
a.pop(2)  #=> ["b", "c"]
a         #=> ["a"]

product(other_ary, ...) → new_ary
product(other_ary, ...) { |p| block } → ary


[1,2,3].product([4,5])     #=> [[1,4],[1,5],[2,4],[2,5],[3,4],[3,5]]
[1,2].product([1,2])       #=> [[1,1],[1,2],[2,1],[2,2]]
[1,2].product([3,4],[5,6]) #=> [[1,3,5],[1,3,6],[1,4,5],[1,4,6],
                           #     [2,3,5],[2,3,6],[2,4,5],[2,4,6]]
[1,2].product()            #=> [[1],[2]]
[1,2].product([])          #=> []

push(obj, ... ) → ary

a = [ "a", "b", "c" ]
a.push("d", "e", "f")
        #=> ["a", "b", "c", "d", "e", "f"]
[1, 2, 3,].push(4).push(5)
        #=> [1, 2, 3, 4, 5]

rassoc(obj) → new_ary or nil

a = [ [ 1, "one"], [2, "two"], [3, "three"], ["ii", "two"] ]
a.rassoc("two")    #=> [2, "two"]
a.rassoc("four")   #=> nil

Examples:

a = [1, 2, 3]
a.repeated_combination(1).to_a  #=> [[1], [2], [3]]
a.repeated_combination(2).to_a  #=> [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
a.repeated_combination(3).to_a  #=> [[1,1,1],[1,1,2],[1,1,3],[1,2,2],[1,2,3],
                                #    [1,3,3],[2,2,2],[2,2,3],[2,3,3],[3,3,3]]
a.repeated_combination(4).to_a  #=> [[1,1,1,1],[1,1,1,2],[1,1,1,3],[1,1,2,2],[1,1,2,3],
                                #    [1,1,3,3],[1,2,2,2],[1,2,2,3],[1,2,3,3],[1,3,3,3],
                                #    [2,2,2,2],[2,2,2,3],[2,2,3,3],[2,3,3,3],[3,3,3,3]]
a.repeated_combination(0).to_a  #=> [[]] # one combination of length 0

Examples:

a = [1, 2]
a.repeated_permutation(1).to_a  #=> [[1], [2]]
a.repeated_permutation(2).to_a  #=> [[1,1],[1,2],[2,1],[2,2]]
a.repeated_permutation(3).to_a  #=> [[1,1,1],[1,1,2],[1,2,1],[1,2,2],
                                #    [2,1,1],[2,1,2],[2,2,1],[2,2,2]]
a.repeated_permutation(0).to_a  #=> [[]] # one permutation of length 0

replace(other_ary) → ary

a = [ "a", "b", "c", "d", "e" ]
a.replace([ "x", "y", "z" ])   #=> ["x", "y", "z"]
a                              #=> ["x", "y", "z"]

reverse → new_ary

[ "a", "b", "c" ].reverse   #=> ["c", "b", "a"]
[ 1 ].reverse               #=> [1]

reverse! → ary

Reverses self in place.

a = [ "a", "b", "c" ]
a.reverse!       #=> ["c", "b", "a"]
a                #=> ["c", "b", "a"]

reverse_each { |item| block } → ary
reverse_each → Enumerator

Same as #each, but traverses self in reverse order.

a = [ "a", "b", "c" ]
a.reverse_each {|x| print x, " " }

produces:

c b a

rindex(obj) → int or nil
rindex { |item| block } → int or nil
rindex → Enumerator

a = [ "a", "b", "b", "b", "c" ]
a.rindex("b")             #=> 3
a.rindex("z")             #=> nil
a.rindex { |x| x == "b" } #=> 3

rotate(count=1) → new_ary

a = [ "a", "b", "c", "d" ]
a.rotate         #=> ["b", "c", "d", "a"]
a                #=> ["a", "b", "c", "d"]
a.rotate(2)      #=> ["c", "d", "a", "b"]
a.rotate(-3)     #=> ["b", "c", "d", "a"]

rotate!(count=1) → ary

a = [ "a", "b", "c", "d" ]
a.rotate!        #=> ["b", "c", "d", "a"]
a                #=> ["b", "c", "d", "a"]
a.rotate!(2)     #=> ["d", "a", "b", "c"]
a.rotate!(-3)    #=> ["a", "b", "c", "d"]

sample → obj
sample(random: rng) → obj
sample(n) → new_ary
sample(n, random: rng) → new_ary

a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a.sample         #=> 7
a.sample(4)      #=> [6, 4, 2, 5]

select { |item| block } → new_ary
select → Enumerator

[1,2,3,4,5].select { |num|  num.even?  }   #=> [2, 4]

a = %w{ a b c d e f }
a.select { |v| v =~ /[aeiou]/ }  #=> ["a", "e"]

See also Enumerable#select.
select! {|item| block } → ary or nil
select! → Enumerator

If no block is given, an Enumerator is returned instead.
shift → obj or nil
shift(n) → new_ary

args = [ "-m", "-q", "filename" ]
args.shift     #=> "-m"
args           #=> ["-q", "filename"]

args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
args           #=> ["filename"]

shuffle → new_ary
shuffle(random: rng) → new_ary

a = [ 1, 2, 3 ]           #=> [1, 2, 3]
a.shuffle                 #=> [2, 3, 1]

a.shuffle(random: Random.new(1))  #=> [1, 3, 2]

a = [ "a", "b", "c", "d", "e" ]
a[2] +  a[0] + a[1]    #=> "cab"
a[6]                   #=> nil
a[1, 2]                #=> [ "b", "c" ]
a[1..3]                #=> [ "b", "c", "d" ]
a[4..7]                #=> [ "e" ]
a[6..10]               #=> nil
a[-3, 3]               #=> [ "c", "d", "e" ]
# special cases
a[5]                   #=> nil
a[6, 1]                #=> nil
a[5, 1]                #=> []
a[5..10]               #=> []

slice!(index) → obj or nil
slice!(start, length) → new_ary or nil
slice!(range) → new_ary or nil

a = [ "a", "b", "c" ]
a.slice!(1)     #=> "b"
a               #=> ["a", "c"]
a.slice!(-1)    #=> "c"
a               #=> ["a"]
a.slice!(100)   #=> nil
a               #=> ["a"]

sort → new_ary
sort { |a, b| block } → new_ary

a = [ "d", "a", "e", "c", "b" ]
a.sort                    #=> ["a", "b", "c", "d", "e"]
a.sort { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]

sort! → ary
sort! { |a, b| block } → ary

a = [ "d", "a", "e", "c", "b" ]
a.sort!                    #=> ["a", "b", "c", "d", "e"]
a.sort! { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]

sort_by! { |obj| block } → ary
sort_by! → Enumerator

a = [1, 2, 3, 4, 5, 0]
a.take(3)             #=> [1, 2, 3]

take_while { |arr| block } → new_ary
take_while → Enumerator

a = [1, 2, 3, 4, 5, 0]
a.take_while { |i| i < 3 }  #=> [1, 2]

to_a → ary

to_ary → ary

to_h → hash

[[:foo, :bar], [1, 2]].to_h
  # => {:foo => :bar, 1 => 2}

to_s()
Alias for: inspect
transpose → new_ary

a = [[1,2], [3,4], [5,6]]
a.transpose   #=> [[1, 3, 5], [2, 4, 6]]

If the length of the subarrays don’t match, an IndexError is raised.
uniq → new_ary
uniq { |item| ... } → new_ary

Returns a new array by removing duplicate values in self.

If a block is given, it will use the return value of the block for comparison.

It compares values using their hash and eql? methods for efficiency.

a = [ "a", "a", "b", "b", "c" ]
a.uniq   # => ["a", "b", "c"]

b = [["student","sam"], ["student","george"], ["teacher","matz"]]
b.uniq { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]

uniq! → ary or nil
uniq! { |item| ... } → ary or nil

a = [ "a", "a", "b", "b", "c" ]
a.uniq!   # => ["a", "b", "c"]

b = [ "a", "b", "c" ]
b.uniq!   # => nil

c = [["student","sam"], ["student","george"], ["teacher","matz"]]
c.uniq! { |s| s.first } # => [["student", "sam"], ["teacher", "matz"]]

unshift(obj, ...) → ary

a = [ "b", "c", "d" ]
a.unshift("a")   #=> ["a", "b", "c", "d"]
a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]

values_at(selector, ...) → new_ary

a = %w{ a b c d e f }
a.values_at(1, 3, 5)          # => ["b", "d", "f"]
a.values_at(1, 3, 5, 7)       # => ["b", "d", "f", nil]
a.values_at(-1, -2, -2, -7)   # => ["f", "e", "e", nil]
a.values_at(4..6, 3...6)      # => ["e", "f", nil, "d", "e", "f"]

zip(arg, ...) → new_ary
zip(arg, ...) { |arr| block } → nil

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].zip(a, b)   #=> [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
[1, 2].zip(a, b)      #=> [[1, 4, 7], [2, 5, 8]]
a.zip([1, 2], [8])    #=> [[4, 1, 8], [5, 2, nil], [6, nil, nil]]

ary | other_ary → new_ary

[ "a", "b", "c" ] | [ "c", "d", "a" ]    #=> [ "a", "b", "c", "d" ]

