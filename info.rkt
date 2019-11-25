#lang info

(define collection "mc-scripts")

(define deps '("base" 
               "lang-file"))

(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/manual.scrbl" ())))


(define compile-omit-paths '(
  "raco-tools"))

(define raco-commands
  '(("run-script"            mc-scripts/raco-tools/raco-new-script "Fetches script and installs it." 100)
))

