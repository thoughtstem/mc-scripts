#lang racket

(require framework/preferences)

(preferences:set-default 'drracket:show-line-numbers? #t boolean?)
(preferences:set 'drracket:show-line-numbers? #t)

(preferences:set-default 'drracket:online-compilation-default-on #f boolean?)
(preferences:set 'drracket:online-compilation-default-on #f)

(preferences:set-default 'drracket:defs/ints-horizontal #t boolean?)
(preferences:set 'drracket:defs/ints-horizontal #t)

(preferences:set-default 'drracket:tools-configuration '() list?)
(preferences:set 'drracket:tools-configuration
                 '(
                  (((lib "version") "tool.rkt") skip)
                  (((lib "stepper") ("stepper+xml-tool.rkt")) skip)
                  (((lib "xml") ("text-box-tool.rkt")) skip)
                  (((lib "test-engine") ("test-tool.scm")) skip)
                  (((lib "swindle") ("tool.rkt")) skip)
                  (((lib "deinprogramm" "signature") "tool.rkt") skip)
                  (((lib "repo-time-stamp") "time-stamp.rkt") skip)
                  (((lib "rackunit") ("tool.rkt")) skip)
                  (((lib "slideshow") ("tool.rkt")) skip)
                  (((lib "optimization-coach") ("tool.rkt")) skip)
                  (((lib "macro-debugger") ("tool.rkt")) skip)
                  (((lib "lazy") ("lazy-tool.rkt")) skip)
                  (((lib "lang") "htdp-langs.rkt") skip)
                  (((lib "gui-debugger") ("debug-tool.rkt")) skip)
                  (((lib "frtime" "tool") "frtime-tool.rkt") skip)
                  (((lib "deinprogramm") "deinprogramm-langs.rkt") skip)
                  (((lib "drracket") "syncheck.rkt") load)
                  (((lib "browser") ("tool.rkt")) skip)
                  (((lib "algol60") ("tool.rkt")) skip)
                  ))