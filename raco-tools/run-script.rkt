#lang racket

(define script-name
  (command-line
   #:args (name)
   name))

(displayln (~a "Fetching " script-name " script..."))

(system (~a "echo 'racket <(curl https://metacoders.org/scripts/"
            script-name
            ".rkt)' | bash"))



