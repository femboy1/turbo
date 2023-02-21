# Turbo
A state-based programming language.

## Introduction

Turbo is a language specifically focused on logic and algebra. Similar to a language such as Prolog, Turbo isn't a "numeric" programming language, it is an abstract one.

## Paradigm

Turbo is a simple and naive predicate resolver. It can resolve simple predicate expressions.

### Example

```
Even(n) => 
    Natural(q);
    !q: n = 2*q;

?Even(2);
```

Returns `true`.
