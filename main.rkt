#lang racket/base

(require pict racket/draw racket/class racket/contract)

(provide iu-logo)

(define crimson (make-color #x99 0 0))

(define/contract (iu-logo w [h (floor (* w 1.25))])
  (->* (positive?) (positive?) pict?)
  (define (draw dc x y)
    ;; Save things we'll need
    (define old-brush (send dc get-brush))
    (define old-pen (send dc get-pen))
    (define old-transformation (send dc get-transformation))

    (define scale-x (/ w 100))
    (define scale-y (/ h 125))

    (send* dc
      (translate x y)
      (set-scale scale-x scale-y)
      (set-pen (new pen% [width 1] [color crimson]))
      (set-brush (new brush% [color crimson])))

    (define path (new dc-path%))
    (send* path
      ;upper left of I serif
      (move-to 33 0)
      ;upper right of I serif
      (line-to 67 0)
      (line-to 67 9)
      ; top of vertical stem of I
      (line-to 60 9)
      ; I meets U, top right
      (line-to 60 79)
      (line-to 74 79)
      (line-to 74 26)
      ; beginning to draw U serif
      (line-to 67 26)
      (line-to 67 16)
      (line-to 100 16)
      (line-to 100 26)
      (line-to 93 26)
      ; downward side of U
      (line-to 93 87)
      ; bend of U
      (line-to 80 96)
      (line-to 60 96)
      ;back on I
      (line-to 60 114)
      ; begin bottom serif of I
      (line-to 67 114)
      (line-to 67 126)
      (line-to 33 126)
      (line-to 33 114)
      (line-to 40 114)
      ; begin going up LHS of bottom of I
      (line-to 40 96)
      ; back on U
      (line-to 20 96)
      (line-to 7 87)
      (line-to 7 26)
      ; U serif
      (line-to 0 26)
      (line-to 0 16)
      (line-to 33 16)
      (line-to 33 26)
      (line-to 27 26)
      (line-to 27 79)
      (line-to 40 79)
      (line-to 40 9)
      (line-to 33 9)
      (close))
    (send* dc
      (draw-path path)
      (set-transformation old-transformation)
      (set-brush old-brush)
      (set-pen old-pen)))
  (dc draw w h))
