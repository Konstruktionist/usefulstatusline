if (exists('loaded_usefulstatusline_plugin')) || !has('statusline')
	finish
endif
let g:loaded_usefulstatusline_plugin=1

if (!exists('g:currentmode'))
	let g:currentmode={
		\ 'n'  : 'Normal',
		\ 'no' : 'N·Operator Pending',
		\ 'v'  : 'Visual',
		\ 'V'  : 'V·Line',
		\ '' : 'V·Block',
		\ 's'  : 'Select',
		\ 'S'  : 'S·Line',
		\ '' : 'S·Block',
		\ 'i'  : 'Insert',
		\ 'R'  : 'Replace',
		\ 'Rv' : 'V·Replace',
		\ 'c'  : 'Command',
		\ 'cv' : 'Vim Ex',
		\ 'ce' : 'Ex',
		\ 'r'  : 'Prompt',
		\ 'rm' : 'More',
		\ 'r?' : 'Confirm',
		\ '!'  : 'Shell',
		\}
endif
