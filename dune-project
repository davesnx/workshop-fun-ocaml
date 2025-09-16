(lang dune 3.19)
(using melange 0.1)
(using directory-targets 0.1)
(using mdx 0.4)

(cram enable)
(name workshop)

(license MIT)

(implicit_transitive_deps false)

(package
 (name workshop)
 (synopsis "Rendering React components on the server natively")
  (allow_empty))

(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess
   (run mlx-pp %{input-file}))))
