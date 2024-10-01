> Бутвин Михаил

[Project Euler](https://projecteuler.net/) problems solutions in [Refal-5λ](https://github.com/bmstu-iu9/refal-5-lambda)


## Build and run

Install Refal-5λ compiler
```bash
curl -L https://bmstu-iu9.github.io/refal-5-lambda/setup.bash | bash
```

Run the test suite:
```bash
sh tests/test.sh
```

## Conclusion of the Refal-5λ language

Refal-5λ allows to write expressive and consise code when it comes to working with text or other concatenated data.
But lack of standard library (even booleans are not built-in) forces to write a lot of boilerplate code.
And without referential transparency and curring make code not such elegant as it could be in functional languages like Haskell or OCaml.
But despite this, Refal-5λ has more powerful pattern matching and destructuring capabilities.
And its computational model allows to write code without necessity to think about tail recursion and stack overflow.
