(lang dune 2.2)
(generate_opam_files true)

(name async_app)
(version 0.0.1)

(authors "davesnx")
(license "BSD-2")
(maintainers "davesnx")
(source (uri "git+https://github.com/davesnx/async_app.git"))
(homepage "https://github.com/davesnx/async_app")
(bug_reports "https://github.com/davesnx/async_app/issues")
(documentation "https://github.com/davesnx/async_app")

(package
 (name async_app)
 (synopsis "Async app synopsis")
 (description "Async app description")
 (depends
  ;; General system dependencies
  (dune (>= 2))
  (ocaml (>= 4.10.0))
  (core (>= 0.14.0))

  ;; Database interface
  (caqti (>= 1.2.1))
  (caqti-lwt (>= 1.2.0))
  (caqti-driver-postgresql (>= 1.2.1))
  (ppx_rapper (and (>= 0.9.2) (< 2.0)))

  ;; Web toolkit
  (opium (>= 0.17.1))
  (routes (and (>= 0.8.0) (< 0.9.0)))
  (reason (and (>= 3.6.0) (< 4.0.0)))
  (uri (and (>= 3.1.0) (< 4.0.0)))
  (atdgen (and (>= 2.2.1) (< 2.3.0)))

  ;; HTML generation
  (tyxml :dev)
  (tyxml-jsx :dev)
  (tyxml-syntax :dev)

  ;; Dev dependencies
  (alcotest (>= 1.2.3) :dev)
))
