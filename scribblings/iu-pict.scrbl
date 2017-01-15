#lang scribble/manual

@require[@for-label[racket/base iu-pict pict]]

@title{Indiana University pict}
@author{David Christiansen}

@defmodule[iu-pict]

The Indiana University logo is convenient for IU slideshows. Here it is as a @racket[pict].

@local-table-of-contents[]

@section[#:tag "logo"]{The IU Logo}
@defproc[(iu-logo (w positive?) (h positive? (floor (* w 1.25)))) pict?]{
Draw the IU logo as a pict with width @racket[w] and height @racket[h]. If @racket[h] is omitted, the correct proportions are used.
}
