#lang racket

(require raco/command-name
         racket/runtime-path)

(define-runtime-path base
  "prototype-city")

(define metacoders-city
  (command-line
   #:args (name)
   name))

(displayln (~a "Creating " metacoders-city))

(directory-list base)

(define dest 
  (build-path (current-directory) metacoders-city))

(copy-directory/files base dest)

(define (string-sub-all! folder find replace)
  (define (string-sub f find replace)
    (define src-text (file->string (build-path folder f)))
    (define new-text (string-replace #:all? #t src-text find replace))

    (with-output-to-file #:exists 'replace
      (build-path folder f)
      (thunk
        (display new-text))))

  (define files
    (filter (lambda(f)
              (file-exists? (build-path folder f))) 
              (directory-list folder)))

  (for ([file (in-list files)])
    ;(displayln (~a "Found replacement? " file))
    (string-sub file find replace)))

(string-sub-all! dest
  "CITY-NAME" metacoders-city)

(string-sub-all! (build-path dest "scribblings")
  "CITY-NAME" metacoders-city)

(string-sub-all! (build-path dest "CITY-NAME-lib")
  "CITY-NAME" metacoders-city)

(string-sub-all! (build-path dest "CITY-NAME-site")
  "CITY-NAME" metacoders-city)

(rename-file-or-directory (build-path dest "scribblings/CITY-NAME.scrbl")	 	 	 	 
                          (build-path dest "scribblings" (~a metacoders-city ".scrbl")))	 	 	 	 

(rename-file-or-directory (build-path dest "CITY-NAME-lib")	 	 	 	 
                          (build-path dest (~a metacoders-city "-lib")))

(rename-file-or-directory (build-path dest "CITY-NAME-site")	 	 	 	 
                          (build-path dest (~a metacoders-city "-site")))

(displayln (~a "Created " metacoders-city))
(displayln (~a "Next steps:"))
(displayln (~a "cd " metacoders-city "lib; raco pkg install; cd .."))
(displayln (~a "cd " metacoders-city "site; raco pkg install; cd .."))
(displayln "racket main.rkt")
