# L-system-explorations

A repository tackeling the diverse visual outputs of L-Systems

## Basics

L-Systems are based on strings and are a way to apply a recursive function to a sentence. 

Every L-System consists of:
* Alphabet: e.g. A B 
* Axiom: Generation Zero Sentence, e.g. 'A'
* Ruleset: 
  * 'A' => A B A
  * 'B' => B B B 

```
         A

  A      B      A

A B A  B B B  A B A 
```

## Code Approach

We are using a recursive function to create an always growing array of characters.

```
Gen1  [A]
Gen2  [A, B, A]
Gen3  [A, B, A, B, B, B, A, B, A]
```

In Processing we use a `StringBuffer` for this, it's very efficent and comes with an `append()` method. 


## References

* [Nature of Code, by Daniel Shiffman, L-Systems](https://www.youtube.com/watch?v=f6ra024-ASY)
* [The Algorithmic Beauty of Plants, by Aristid Lindenmayer](http://algorithmicbotany.org/papers/abop/abop.pdf)
