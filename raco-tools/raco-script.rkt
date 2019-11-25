#lang racket

(require raco/command-name
         racket/runtime-path)

(define script-name
  (command-line
   #:args (name)
   name))

(displayln (~a "Fetching " script-name " script..."))

