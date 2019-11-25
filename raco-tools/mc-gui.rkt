#lang racket

(define home-path
  (find-system-path 'home-dir))

(define racket-version
  (version))

(system (~a "cp " home-path ".racket/" racket-version "/pkgs/mc-scripts/script-runner.desktop "
            home-path "Desktop/"))
(system (~a "chmod +x " home-path "Desktop/script-runner.desktop"))



