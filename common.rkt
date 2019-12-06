#lang at-exp racket

(provide check-pkg)

(define racket-version
  (version))

(define home-path
  (find-system-path 'home-dir))

(define test-path
  (~a  home-path "Desktop/TEST-FILES/"))

(define (pkg-path pkg)
  (~a home-path ".racket/" racket-version "/pkgs/" pkg))

(define (msg-alert s)
  (println "#######################################")
  (println (~a "# " s " ..."))
  (println "#######################################"))

(define (update-pkg pkg)
  (msg-alert (~a "Package " pkg " is installed, updating"))
  (system (~a "raco pkg update --auto --update-deps --batch --skip-uninstalled --no-setup " pkg)))

(define (install-pkg pkg url)
  (msg-alert (~a "Package " pkg " is not installed, installing"))
  (system (~a "raco pkg install --auto --update-deps --batch --skip-installed --no-setup " url)))

(define (install-or-update pkg url)
  (if (directory-exists? (pkg-path pkg))
      (update-pkg pkg) 
      (install-pkg pkg url)))

(define (check-pkg pkg url code)
  (if (and (list? pkg)
           (list? url))
      (map install-or-update pkg url)
      (install-or-update pkg url))
  (run-setup pkg)
  (if (and (list? code)
           (list? pkg))
      (begin
        (set! pkg (map (curryr ~a "-test") pkg))
        (map add-test code pkg))
      (add-test code (~a pkg "-test"))))

(define (run-code name)
  (msg-alert (~a "Running " name " from " test-path))
  (system (~a "racket " test-path name ".rkt")))

(define (add-test code name)
  (msg-alert (~a "Adding " name " to " test-path))
  (if (directory-exists? test-path)
      (put-test-file code name)
      (begin
        (system (~a "mkdir " test-path))
        (put-test-file code name)))
  (run-code name))

(define (put-test-file code name)
   (system (~a "echo '" code "' > " test-path name ".rkt;")))

(define (run-setup pkg)
  (if (list? pkg)
      (set! pkg (apply ~a (map (curryr ~a " ") pkg)))
      #t)
            
  (msg-alert (~a "Running raco setup on " pkg))
  (system (~a "raco setup " pkg)))
  

