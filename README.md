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

We are using a recursive function to create an always growing array of characters. Check code example `NOC_8_08_SimpleLSystem`

```
Gen1  [A]
Gen2  [A, B, A]
Gen3  [A, B, A, B, B, B, A, B, A]
```

In Processing we use a `StringBuffer` for this, it's very efficent and comes with an `append()` method. 

### Drawing with L-Systems

Similar to the _Turtle Drawing_ approach. A turtle can:

* 'F' => Draw a line (`line(), translate()`)
* 'G' => Move fwd without drawing (`translate()`)
* '+' => Turn right (at some angle) (`rotate()`)
* '-' => Turn left (at some angle) (`rotate()`)

But in order to be able to draw fractal patterns you also need to be able to save some positions:

* '[' => save state (position, direction) (`pushMatrix()`)
* ']' => restore state (go there) (`popMatrix()`)

Check code example `NOC_8_09_LSystem`

## References

* [Nature of Code, by Daniel Shiffman, L-Systems](https://www.youtube.com/watch?v=f6ra024-ASY)
* [The Algorithmic Beauty of Plants, by Aristid Lindenmayer](http://algorithmicbotany.org/papers/abop/abop.pdf)
