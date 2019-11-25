#lang info

(define collection "mc-scripts")

(define deps '("base" 
               "lang-file"))

(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/manual.scrbl" ())))


(define compile-omit-paths '(
  "raco-tools"))

(define raco-commands
  '(("run-script" mc-scripts/raco-tools/run-script "Fetches script and installs it." 100)
    ("mc-gui"     mc-scripts/raco-tools/mc-gui     "Adds the MC Script Runner to the Desktop." 100)
    ))

