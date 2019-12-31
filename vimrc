"pluginy
	"vundle
		set rtp+=~/.vim/bundle/Vundle.vim
		call vundle#begin()
		filetype off
		"managed plugins
			Plugin 'jnurmine/Zenburn'
			Plugin 'gmarik/Vundle.vim'
			Plugin 'godlygeek/tabular'
			Plugin 'honza/vim-snippets'
			Plugin 'python-mode/python-mode'
			Plugin 'vim-airline/vim-airline'
			Plugin 'vim-airline/vim-airline-themes'
			Plugin 'scrooloose/nerdcommenter'
			Plugin 'w0rp/ale'
			Plugin 'tobyS/skeletons.vim'
			Plugin 'tpope/vim-fugitive'
			"Plugin 'nathanaelkane/vim-indent-guides'
			Plugin 'fmoralesc/vim-pinpoint'
			Plugin 'scrooloose/nerdtree'
			Plugin 'ctrlpvim/ctrlp.vim'
			Plugin 'airblade/vim-gitgutter'
			Plugin 'sheerun/vim-polyglot'
		call vundle#end()
		filetype plugin indent on
		"Python mode
			let g:pymode_python = 'python3' "use python3 syntax check by default
			setlocal commentstring=#%s
			setlocal define=^\s*\\(def\\\\|class\\)
		"vim-indent-guides
			let g:indent_guides_enable_on_vim_startup = 1
		" vim-airline setup
			let g:airline_powerline_fonts = 1
			if !exists('g:airline_symbols')
				let g:airline_symbols = {}
			endif
			" unicode symbols
			let g:airline_left_sep = '»'
			let g:airline_left_sep = '▶'
			let g:airline_right_sep = '«'
			let g:airline_right_sep = '◀'
			let g:airline_symbols.linenr = '␊'
			let g:airline_symbols.linenr = '␤'
			let g:airline_symbols.linenr = '¶'
			let g:airline_symbols.branch = '⎇'
			let g:airline_symbols.paste = 'ρ'
			let g:airline_symbols.paste = 'Þ'
			let g:airline_symbols.paste = '∥'
			let g:airline_symbols.whitespace = 'Ξ'

"generic
	set nocompatible				"nie je to vi ale vim
	set visualbell					"vizualny zvoncek
	set title
	set titlestring=VIM\ %f%y%m%r			"titulok
	set mouse=a					"mys v konzole
	set confirm					"ak som nepouzil ! a mal som, tak sa ma spyta co robit
	set nojoinspaces				"pri spajani riadkov nedava dve medzery
	set clipboard=unnamed				"vsetko co sa uklada do "unnamed" registra sa bude ukladat zaroven aj do clipboardu
	set autochdir					"automaticky prejde do adresara s otvaranym suborom
	autocmd! bufwritepost .vimrc source %		"pri ulozeni automaticky nacita .vimrc

"ovladanie
	set backspace=indent,eol,start 			"backspace maze odsadenie, konce riadkov,...
	let mapleader = ","
	let maplocalleader = ","

"zvyraznovanie
	syntax on
	set showmatch					"zvyraznenie zatvoriek

"formaty
	set fileencodings=utf-8,iso8859-2,cp1250
	set fileformats=unix,dos

"statusline
	set showcmd					"ukazuje príkazy na poslednom riadku
	set laststatus=2				"znamena, ze chceme, aby bol stavovy riadok vzdy zapnuty

"pozicia
	set number					"zobrazuje císla riadkov
	set ruler					"zobrazuje poziciu kurzoru

"zobrazenie
	set scrolloff=3					"minimalny pocet viditelnych riadkov pri rolovani
	set sidescroll=3				"to iste pri posune za stranu
	set wrap					"zobrazuje riadky zalomene
	set linebreak					"zlom iba v slove
	set autoindent					"iba zachovava odsadenie
	set smartindent					"zachovava odsadenie ale inteligentne ho vie zvacsit/zmensit
	filetype plugin indent on			"odsadzovanie podla filetyp
	set guifont=MonacoB:h18

"vyhladavanie
	set wrapscan					"po dosiahnuti konca suboru sa hlada znovu od zaciatku
	set hlsearch					"zvyraznenie hladaneho textu
	set ignorecase					"pri hladani nerozlisuje velke a male pismena
	set smartcase					"ignorecase plati iba vtedy ak v hladanom vyraze su iba male pismena
	set incsearch					"ukazuje mi co hladam este predtym co dam Enter

"slovniky
	set helplang=cs					"jazyk napovedy
	map <Leader>s :set spell spelllang=cs,en<Return>
	map <Leader>S :set nospell<Return>

"doplnovanie
	set wildchar=<Tab>
	set wildmenu					"v :prikazovom riadku zobrazi menu pre vyber
	set wildmode=list:longest,list:full		"chovanie TAB v prikazovom riadku
	set wildignore=*~,*.o,*.aux			"ignoruje pri doplnovani tabulatorom

"sudo trick
	cmap w!! w !sudo tee > /dev/null %

"odsadzovanie
	set tabstop=4					"odsadenie tabulatora
	set shiftwidth=4				"sirka odsadenia pri >>
	set noexpandtab					"use tabs, not spaces
	set shiftround					"zaokruhluj pocet medzier pri odsadzovani (>> C-T << C-D) na nasobok shiftwidth.
	vnoremap < <gv					"v priebehu odsadzovania zachova vyber
	vnoremap > >gv

"historia a zalohovanie
	set history=200
	set backup
	set backupdir=~/.vim/backup

"folding
	set foldmethod=indent
	set foldmarker=##,::

"filetype specific options
	

"vzhlad
	set t_Co=256
	colors zenburn

	"spusti shell z oznacenym prikazom
	"prikaz shell pod kurzorom
		map <Leader>e :!<C-R><C-A>& <Return>
	"oznaceny prikaz
		vmap <Leader>e y:!<C-R>"& <Return>
	"cely riadok zada ako prikaz shell
		map <Leader>E ^v$h<Leader>e
		imap <Leader>E <Esc><Leader>E
	"retazec pod kurzorom vlozi ako URL do prehliadaca
	map <Leader>w :!firefox <C-R><C-A> & <Return>

"formatovanie
	"formatovat odstavec
		map <Leader><Return> gwap
		imap <Leader><Return> <Esc>gwapa
	map <Leader>g<Return> gogqG

set ww=b,s,<,>,[,],~ ",h,l 				"chovanie na prechodu dvoch riadkov

" C-c and C-v - Copy/Paste to global clipboard
vmap <C-c> "+yi
imap <C-v> <esc>"+gpi
