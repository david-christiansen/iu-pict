#lang info
(define collection "iu-pict")
(define version "1.0")
(define deps '("draw-lib"
               "pict-lib"
               "base"))
(define build-deps '("pict-doc"
                     "scribble-lib" "racket-doc"))
(define scribblings '(("scribblings/iu-pict.scrbl" ())))
(define pkg-desc "The Indiana University logo as a pict")
