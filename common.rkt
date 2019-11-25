#lang at-exp racket

(provide msg-alert
         check-pkg
         add-test)

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
  (msg-alert (~a "Package " pkg " is installed, updating ..."))
  (system (~a "raco pkg update --auto --update-deps --batch --skip-uninstalled --no-setup " pkg)))

(define (install-pkg pkg url)
  (msg-alert (~a "Package " pkg " is not installed, installing ..."))
  (system (~a "raco pkg install --auto --update-deps --batch --skip-installed --no-setup " url)))

(define (check-pkg pkg url)
  (if (directory-exists? (pkg-path pkg))
      (update-pkg pkg) 
      (install-pkg pkg url)))

(define (add-test code name)
  (if (directory-exists? test-path)
      (put-test-file code name)
      (begin
        (system (~a "mkdir " test-path))
        (put-test-file code name))))

(define (put-test-file code name)
   (system (~a "echo '" code "' > " test-path name ".rkt;")))

