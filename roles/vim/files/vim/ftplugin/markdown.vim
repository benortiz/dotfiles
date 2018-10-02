" Do not hide characters based on syntax
" For unknown reasons, I have to do BOTH, set vim to conceal nothing and turn
" off the indentLine plugin's conceal
set conceallevel=0
let g:indentLine_setConceal = 0
