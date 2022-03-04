set fileencodings=ucs-bom,utf-8,GB18030,gbk
set encoding=utf-8
" 使用utf-8编码

" set enc=utf-8
" 编码设置

set t_Co=256
" 启用256色

set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
" 语言设置

set nu
" 显示行号

set number relativenumber
" 相对行号

set tabstop=4
" tab 缩进为4

set shiftwidth=4
" 缩进为4

set expandtab 
" 将制表符扩展为空格
	


filetype plugin on
" 打开文件类型检测，有这句才能进行智能补全

set autoindent
" 回车后的缩进和上一层保持一致

set cindent
" 智能缩进

set cul
" 高亮当前行

set fdm=syntax
" 根据语义折叠
set foldlevelstart=99
" 默认不折叠
syntax enable
" 开启语法高亮
syntax on
" 允许用户指定语法高亮配色

" 插件安装
call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } "极限搜索文件
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc
Plug 'luochen1990/rainbow' 						" 括号颜色
Plug 'vim-airline/vim-airline'		 			" 底部状态栏
Plug 'vim-airline/vim-airline-themes' 			" airline 的主题
Plug 'scrooloose/nerdcommenter' 				" 快速注释 , \ + c + i
Plug 'crusoexia/vim-monokai'					" 配色
Plug 'jiangmiao/auto-pairs' 					" 括号匹配
" Plug 'octol/vim-cpp-enhanced-highlight' 		" C/C++语法高亮
Plug 'itchyny/vim-cursorword' 					" 下划线高亮
Plug 'tpope/vim-surround' 						" 在文本两端同时插入符号
call plug#end()

" nnoremap <leader>fo :Files<CR>                  " 映射
" nnoremap <leader>fif :Rg<CR>                    " 映射

map <leader>itc ggI/*<Enter><Enter>/<Enter><Esc>kkA<Space>
map <leader>ic  A/*  */<Esc><Left><Left><left>a

colo monokai
" 颜色

" 函数名
highlight Function ctermfg=red
" cterm=bold 加粗
" highlight PrePoc ctermfg=197
" highlight PreProc ctermfg=197
" highlight cPreCondit ctermfg=197
" highlight cPreConditMatch ctermfg=197
" highlight cCppOutWrapper ctermfg=197
" highlight cCppInWrapper ctermfg=197
" highlight cAnsiName ctermfg=197


" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'wombat'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
	   \ '0': '0 ',
	   \ '1': '1 ',
	   \ '2': '2 ',
	   \ '3': '3 ',
	   \ '4': '4 ',
	   \ '5': '5 ',
	   \ '6': '6 ',
	   \ '7': '7 ',
	   \ '8': '8 ',
	   \ '9': '9 '
	   \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR" 




" 快速注释
"add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" python 自动的会多加一个空格
au FileType python let g:NERDSpaceDelims = 0
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1






" 括号颜色
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\	'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}



" 自动执行mkview 和 loadview
" let g:skipview_files = [
			" \ '[EXAMPLE PLUGIN BUFFER]'
			" \ ]
" function! MakeViewCheck()
	" if has('quickfix') && &buftype =~ 'nofile'
		" Buffer is marked as not a file
		" return 0
	" endif
	" if empty(glob(expand('%:p')))
		" File does not exist on disk
		" return 0
	" endif
	" if len($TEMP) && expand('%:p:h') == $TEMP
		" We're in a temp dir
		" return 0
	" endif
	" if len($TMP) && expand('%:p:h') == $TMP
		" Also in temp dir
		" return 0
	" endif
	" if index(g:skipview_files, expand('%')) >= 0
		" File is in skip list
		" return 0
	" endif
	" return 1
" endfunction
" augroup vimrcAutoView
	" autocmd!
	" Autosave & Load Views.
	" autocmd BufWritePost,BufLeave,WinLeave ?* if MakeViewCheck() | mkview | endif
	" autocmd BufWinEnter ?* if MakeViewCheck() | silent loadview | endif
" augroup end
"
cmap W w
cmap Q q

