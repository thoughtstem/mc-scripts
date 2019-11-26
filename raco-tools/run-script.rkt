#lang racket

(require raco/command-name
         racket/runtime-path)

(define script-name
  (command-line
   #:args (name)
   name))

(displayln (~a "Fetching " script-name " script..."))

(system (~a "racket < (curl https://raw.githubusercontent.com/thoughtstem/metacoders-dot-org/gh-pages/"
            script-name
            ".rkt)"))



