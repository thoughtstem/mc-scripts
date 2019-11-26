#lang racket

(define home-path
  (find-system-path 'home-dir))

(define racket-version
  (version))

(define mc-path
  (~a home-path ".racket/" racket-version "/pkgs/mc-scripts/"))

(define (string-sub-all! file find replace)
  (define src-text (file->string file))
  (define new-text (string-replace #:all? #t src-text find replace))

  (with-output-to-file #:exists 'replace
    (build-path file)
    (thunk
     (display new-text))))

(string-sub-all! (build-path mc-path "script-runner.desktop")
  "VERSION" racket-version)

(string-sub-all! (build-path mc-path "script-runner.desktop")
  "HOME" home-path)

(system (~a "cp " home-path ".racket/" racket-version "/pkgs/mc-scripts/script-runner.desktop "
              home-path "Desktop/"))
(system (~a "chmod +x " home-path "Desktop/script-runner.desktop"))

