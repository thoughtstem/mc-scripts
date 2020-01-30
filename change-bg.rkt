#lang racket

(define racket-version
  (version))

(define home-path
  (find-system-path 'home-dir))

(displayln "Changing background...")

(system (~a "DISPLAY=:0.0 xfconf-query --channel xfce4-desktop --property /backdrop/screen0/monitor0/workspace0/last-image --set "
        home-path ".racket/" racket-version "/pkgs/mc-scripts/img/mc-bg.png"))
(system "raco mc-gui")



