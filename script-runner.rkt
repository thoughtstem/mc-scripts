#lang racket/base

(require racket/class
         racket/gui/base
         racket/list
         racket/system
         racket/format) 

(define home-path
  (find-system-path 'home-dir))

(define racket-version
  (version))

; Make a frame by instantiating the frame% class
(define frame (new frame%
                   [label "MC Script Runner"]
                   [width 300]
                   [height 200]
                   [alignment (list 'left 'top)]))

(define mc-canvas%
  (class canvas%
    (super-new)))
      
(define logo-canvas (new mc-canvas%
                         [parent frame]
                         [style (list 'transparent)]
                         [min-width 280]
                         [min-height 110]
                         [paint-callback
                          (lambda (canvas dc)
                            (define pos-center (let-values ([(x y) (send dc get-size)]) (list x y)))
                            (define pos-x (- (/ (first pos-center) 2) 140))
                            (send dc draw-bitmap (read-bitmap (~a home-path ".racket/" racket-version "/pkgs/mc-scripts/mc-logo.png")) pos-x 10)
                            )]))

(define msg (new message% [parent frame] 
                 [horiz-margin 10]
                 [label "Type in a script name."]))

(define text-field (new text-field%
                        (label "")
                        (parent frame)
                        (init-value "")))

(new button% [parent frame]
     [label "Run Script"]
     [callback (lambda (button event)
                 (send msg set-label "Fetching script...")
                 (system (string-append "raco run-script " (send text-field get-value)))
                 (send msg set-label "Done.")
                 (send text-field set-value ""))])




(send frame show #t)