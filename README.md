# mlx, Melange, React and Server Components




## Requirements

- clone this repo https://github.com/davesnx/workshop-fun-ocaml
- npm
- opam
















################
# EXPERIMENTAL #
################




## Introduction

At Ahrefs we shaped a tech-stack that's focused at the web using OCaml, Melange and react.

Melange allows us to compile module-by-module, readable and smaller in bundle-size. While allowing to FFI with JavaScript nicely.

































## Knowledge

1. mlx

An OCaml syntax dialect which adds JSX expressions to the language.

https://github.com/ocaml-mlx/mlx

```
(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess
   (run mlx-pp %{input-file}))))
```













2. melange

https://melange.re/v5.0.0
https://dune.readthedocs.io/en/stable/melange.html

- melange.emit
- how dune works with melange libs











3. Shared libraries
  - Single name, separate compilation
  - copy_files

copy_files example library:
https://github.com/ml-in-barcelona/server-reason-react/tree/main/demo/universal




















4. single-context libraries
  - Show RFC
  - how it works
















5. reason-react
  - idea of melange FFI
  - Showcase reason-react + reason-react-ppx















6. server-reason-react
  - renderToString / renderToStream

https://ml-in-barcelona.github.io/server-reason-react/server-reason-react/index.html
https://github.com/ml-in-barcelona/server-reason-react
https://server-reason-react.fly.dev











7. Server components
  - Versus traditional SSR
    - open https://ahrefs.com
















  - React Server components
  - Async components
  - Suspense
  - client components
  - serialisation (primitives, promises, and components)

