#lang info

(define collection "metacoders-city-maker")

(define deps '("base" 
               "lang-file"))

(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/manual.scrbl" ())))


(define compile-omit-paths '(
  "raco-tools"
  "raco-tools/prototype-city"))

(define raco-commands
  '(("new-city"            metacoders-city-maker/raco-tools/raco-new-city "Creates a new city repo" 100)
))

