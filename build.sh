elm-make src/HtmlLazy.elm --debug --output=docs/html-lazy.html
elm-make src/FocusInput.elm --debug --output=docs/focus-input.html
elm-make src/SvgShift.elm --debug --output=docs/svg-shift.html
elm-make src/ResetInput.elm --debug --output=docs/reset-input.js
elm-make src/Download.elm --debug --output=docs/download.js

# compile error
# elm-make src/PatternMatchErr.elm --output=/dev/null
