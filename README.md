# Turbo
A state-based programming language.

## Introduction

Turbo is a language specifically focused on logic and algebra. Similar to a language such as Prolog, Turbo isn't a "numeric" programming language, it is an abstract one.

## Paradigm

Turbo is a simple and naive predicate resolver. It can resolve simple predicate expressions.

### Example

```js
Even(n) => 
    Natural(q);
    n = 2*q;

Natural(p);
?Even(2*p);
```

Returns `true`.

# Internals Explanation

There are two fundamental objects in Turbo, `T` and `F`.
> ## Turbo Booleans
> * `T`
> * `F`
> 
> ### Aliases
> `T`: `True`, `Tautology`
> 
> `F`: `False`, `Contradiction`

Many operations, such as comparison, greatly complicated the resolution process. Taking even the simple example given above, there are many steps that need to be done.

*The example*
```js
Even(n) => 
    Natural(q);
    n = 2*q;

Natural(p);
?Even(2*p);
```

For a human, this may be trivial to evalute (is a number in the form $2n, n \in \mathbb{N}$ even?), but it is much more complicated to compute with a resolution algorithm. To resolve this issue, Turbo comes equipped with a featured algorithm for resolving such issues. In Turbo, this is called via the `Resolve` operation. In fact, equality is actually just `Resolve` in disguise.

## Predicate Algebra

Turbo stores objects by their references in statements—that is—their predicates. Consider the following sentences:

```js
P(a);
Q(a);
```

Turbo will create a "list" of predicates which define a:

```
{P(φ), Q(φ)}
```

with `φ` being the self-reference operator, that is, `a`.

If we then state

```js
P(h);
Q(h);
```

And then evaluate `?h = a` we will get `T`. Let's consider a much more complicated case:

```js
P(z) => 
    Q(z);
    A(z);

P(a);

Q(b);
A(b);

? a = b;
```

*Because* Turbo is interpreted, very few "flattening" expressions are needed. Turbo will just run through these operations, appending the qualifiers in real time, and then running `Resolve(a, b)`.

Now, take a much, much more complicated example:

```js
U(x) =>
    N(x);
    A(x);

A(x) => 
    N(x);

U(a);

A(b);

? a = b;
```

To a human, it is immediately obvious that `a = b` in this context, but to a dumb computer, it will spit out `false` since you will get the two differing predicate sets `{N(φ), A(φ)}` and `{A(φ)}`. Here, we must flatten the expression to reduce the proposition to `{N(φ), N(φ)} => {N(φ)}` and `{N(φ)}`.

### Defining the Fundamental Operations of Predicate Algebra