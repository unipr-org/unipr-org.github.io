# The IMP Language

IMP is a high-level, imperative, and dynamic programming language inspired by Java. IMP is used as main testing language in LiSA.

## Typing

IMP is dynamically typed, i.e., the type of a variable is checked at run-time. Indeed, IMP does not require to specify the type of 
a variable when declaring it. Moreover, IMP allows binding the same variable through assignment statements to objects of different types. 

```java
def x;
x = -5.2;
x = "Static Analysis is Amazing!";
```

Note that each instruction must end with a semicolon. Moreover, the keyword "def" always precedes the declaration of a variable.
​
## Comments
​
Single line comments start with two forward slashes (`//`).
​
```java
// this is a single line comment
```

Multi lines comments are enclosed between `/*` and `*/`.
```java
/* this is a multi line
comment */
```

## Data Types
​
As usual, variables store data values. IMP variables have one of the following types:
​
#### Basic Types

* **boolean**: `true` or `false`
* **integer**: integer numbers, e.g., `-2`, `1`, `+5`
* **float**: floating point numbers, e.g., `-0.5`, `3.0`, `+5.4`
* **string**: text surrounded by double quotes, e.g., `"Hello!"` (contrary to Java, string is not an object but a basic data type)

#### Reference Types

* **objects** instances of one of the classes defined in the program
* **arrays** of the types defined above

## Access Modifiers

Contrary to Java, IMP has no access modifiers, i.e., the scope of a field, method, constructor, or class shall not be specified, 
and it is understood to be public. 

## Classes
​
An IMP program contains zero or more classes.

```java
class Vehicle {}
```

The `class` keyword is used to declare the IMP class `Vehicle`, whose body is enclosed within the curly `{}` braces. 
As usual in programming, curly braces delimit a block of code.

#### Inheritance
​
An IMP class can inherit attributes and methods from another class. 
​
```java 
class Motorbike extends Vehicle {}
```
​
The `extends` keyword expresses that the class `Motorbike` inherits the `Vehicle` class' attributes and methods, which is a superclass. 
Contrary, the class `Motorbike` is a subclass of the class Vehicle.  

### Class Members
​
Class members are:
* fields
* constructors
* ​methods

Note that as opposed to Java, IMP has no concept of static members of a class. Contrary, it has the concept of final members of a class. 
​
#### Fields
​
Fields are declared by only specifying their name and do not support in-place initialization. 
​
```java
class Vehicle {
    brand = "Audi"; // this raises an error
} 
​
// the correct form is: 
​class Vehicle {
    brand;
    ~Vehicle() {
	this.brand = "Audi"; 
    }
}
```

#### Constructors
​
A constructor is a particular method used to initialize objects, and it can not be overridden. 
A tilde `~` precedes constructors. Note that to invoke a constructor, the tilde is omitted.  

```java
class Motorbike extends Vehicle {
   ~Motorbike(){} // this is a constructor
}
```

#### Methods 
​
A method is a block of code that is executed only when it is called. Methods are declared specifying their name and parameters. 
​
```java
myMethod() {}
```

A `void` method can also have explicit return statements.
​
```java
foo() {
    return;
}
bar(i,w) {
    return i + w;
}
```
​
Note that subclasses cannot override a method preceded by the keyword `final`.
​
## Expressions
​
An expression can be:
1. a literal: any constant value that can be assigned to a variable, e.g., `5`, `"s"`, `true`, `null`, or `-5.2`
2. the keyword `this`, that always refer to the receiver of the method being executed
3. an identifier: an alphanumeric string representing a valid variable name (used also for field names)
4. a logical operation: binary _and_ (`&&`), binary _or_ (`||`), or unary _not_ (`!`)
5. an arithmetic operation: binary _addition_ (`+`), binary _subtraction_ (`-`), binary _multiplication_ (`*`), binary _division_ (`/`), or unary _modulus_ (`%`)
6. a comparison: binary _equal to_ (`==`), binary _not equal_ (`!=`), binary _greater than_ (`>`), binary _less than_ (`<`), binary _greater than or equal to_ (`>=`), or binary _less than or equal to_ (`<=`)
(note that `==` and `!=` are the only comparisons that can be applied to non-numeric operands)
7. an array creation: `new int[5]` that creates a one-dimensional `int` array of length 5 (multi-dimensional arrays are also supported)
8. an access to an array element: `intArray[2]`, where the receiver _must_ be stored into a local variable​ (indexing is 0-based)
9. an object creation: `new Motorbike()` that allocates the object and invokes the corresponding constructor
10. a field access: `this.brand`, where the receiver (`this` or a local variable) _must_ be explicit
11. a method call: `this.foo(x)`, where the receiver (`this`, `super` or a local variable) _must_ be explicit; possible parameters are:
* literals
* variables
* `this`
* a field access
* an array access
* another method call
12. an assignment: `x = 15`, where the left-hand side can be a local variable, a field access or an array access, and the right-hand side is an expression
13. a string concatenation: `str + "foo"`, where the operands are expressions
14. a receiver-less call to a string manipulating method, where each argument might be a string literal (or integer, in some operations), a variable, a field access, an array access or a method call: 
* `strlen(a)` returns the integer length of the string represented by `a`
* `strcat(a, b)` returns the concatenations of the strings represented by `a` and `b`
* `strindex(a, b)` returns the integer index of the first occurrence of the string represented by `b` inside the string represented by `a`
* `streq(a, b)` returns `true` if the contents of the strings represented by `a` and `b` are equal
* `strcon(a, b)` returns `true` if the string represented by `b` is contained into the string represented by `a`
* `strstarts(a, b)` returns `true` if the string represented by `a` starts with the string represented by `b`
* `strends(a, b)` returns `true` if the string represented by `a` ends with the string represented by `b`
* `strrep(a, b, c)` returns a new string that is equal to the one represented by `a` where each occurrence of the string represented by `b` is replaced with the string represented by `c`
* `strsub(a, i, j)` returns the substring of the string represented by  `a`, starting from the position represented by `i` (inclusive) and ending at the position represented by `j` (exclusive)

Note that expressions can also be grouped between parentheses. 

### Variables
​
When created, variables are preceded by the keyword `def`. 

```java
def x;
```
​
The scope of variables in IMP is similar to the one in Java. Indeed, there are the fields, declared inside a class, but outside any method. Fields can be accessed anywhere inside and outside the class. 
Moreover, the local variables are declared inside a method and can not be accessed outside the method. Local variables follow the usual scoping rules, meaning that they are only visible inside the inner-most
block of code, delimited by curly brackets, that contains their definition, and inside all blocks of code that are nested inside it.
​
```java
class Vehicle {
    brand; // this is a field
    countKm() {
        def y = true; // this is a local variable visible until the end of the method
        if (y) {
            def x = 5; // this is a local variable visible until the end of the if block
        }
    }
}
```

## Control flow

#### IF Statement
​
The `if` statement is used to specify a block of code to be executed if a condition is `true`. The condition is an expression enclosed in parenthesis `()`.

```java
def x = 4;
def y = 3;
if (x != 5) {
    return y;
}
```
​
The variable `x` is initialized to the integer value 4. It follows that the `if` statement's condition is `true`, and the value of the variable `y` is returned. 
​
#### ELSE Statement
​
The `else` statement is used to specify a block of code to be executed if a condition is `false`. Note that the `else` statement is optional. 
```java
def x = 5;
def y = 3;
if (x != 5) {
    return y;
} else {
    y = y + 1;
}
```

The variable `x` is initialized to the integer value 5. It follows that the `if` statement's condition is `false`, and the value of the variable `y` is increased by 1. 
​
If only one instruction is present in the `if` and `else` blocks, then the curly braces can be omitted. 
​
#### WHILE Loop
​
A `while` loop keeps executing a block of code while a condition is true. The condition is an expression enclosed in parenthesis `()`.
​
```java
def i = 5; 
while (i < 100) {
    i = i * 2;
}
```
​
The variable `i` is initialized to the integer value 5, and it is multiplied by 2 until its value will be grater than 100. 

If only one instruction is present in the while body, then the curly braces can be omitted. 
​
#### FOR Loop
​
A `for` loop is composed by three instructions: an initialization, a condition, and a post-operation. The initialization is executed only once at the beginning of the loop.
Then, the loop body is repeated while the conditon holds. At each iteration of the loop, after executing the whole loop body, the post-operation is executed.
The initialization is a local variable declaration or an expression, while the condition and the post-operation are expressions. All three are optional, but the semicolons are not.

```java
for (def i = 0; i < 20; i = i + 1){
    y = y + 5;
}
```
​
The variable `i` is initialized to the integer value 0, and it is increased by 5 until its value will be grater than 20. 
​
If only one instruction is present in the for body, then the curly braces can be omitted. 
​
## Throwing errors
​
It is possible to throw any object to raise errors using the `throw` keyword. 
​
```java
throw countKm();
def cKm = counKm();
throw cKm;
```

## Assertions
​
Assertions are allowed, using the `assert` keyword followed by a Boolean expression. 
​
```java
assert x == 10; 
```
