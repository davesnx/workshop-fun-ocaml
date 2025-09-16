(lang dune 3.19)
(using melange 0.1)
(using directory-targets 0.1)
(using mdx 0.4)

(cram enable)
(name workshop)

(license MIT)

(generate_opam_files true)
(implicit_transitive_deps false)

(package
 (name workshop)
 (synopsis "Rendering React components on the server natively")
  (allow_empty)
 (depends
  (ocaml (>= 4.14.1))
  (melange (>= 3.0.0))
  mlx
  ocamlformat-mlx

  dream
  (lwt (>= 5.6.0))
  (lwt_ppx (>= 2.1.0))
  (yojson (>= 2.2.0))
  (melange-fetch (>= 0.1.0))
  (melange-json (>= 2.0.0))
  (melange-json-native (>= 2.0.0))
  (melange-webapi (>= 0.21.0))
  (reason-react (>= 0.16.0))

  ; Dev dependencies
  (ocaml-lsp-server (= 1.21.0))

  (dream
   (and
    (= 1.0.0~alpha8)
    :with-dev-setup)) ; We use dream on the demo

  (reason-react-ppx :with-dev-setup)
  (server-reason-react :with-dev-setup)
))

(dialect
 (name mlx)
 (implementation
  (extension mlx)
  (merlin_reader mlx)
  (preprocess
   (run mlx-pp %{input-file}))))
