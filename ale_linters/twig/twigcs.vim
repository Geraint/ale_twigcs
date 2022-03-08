" Author: dshumaker <https://github.com/dshumaker>
" Description: This file adds support for checking twig templates with twigcs.

call ale#Set('twig_twigcs_executable', 'vendor/bin/twigcs')

function! ale_linters#twig#twigcs#Handle(buffer, lines) abort
    " Matches patterns like the following:
    "
    " path/to/template.html.twig
    " l.3 c.10 : ERROR A print statement should start with 1 space.
    " l.3 c.19 : ERROR A print statement should end with 1 space.
    " l.5 c.11 : ERROR There should be 0 space before the "|".
    " l.5 c.13 : ERROR There should be 0 space after the "|".
    " 4 violation(s) found

    let l:pattern = '^l\.\(\d\+\) c\.\(\d\+\) : \([A-Z]\)[A-Z]\+ \(.*\)$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': l:match[2] + 1,
        \   'type': l:match[3],
        \   'text': l:match[4],
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('twig', {
\   'name': 'twigcs',
\   'executable': {b -> ale#Var(b, 'twig_twigcs_executable')},
\   'command': '%e %s',
\   'callback': 'ale_linters#twig#twigcs#Handle',
\})
