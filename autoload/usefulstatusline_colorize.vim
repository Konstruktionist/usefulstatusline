function! usefulstatusline_colorize#Colorize()
	" Solarized && g:solarized_vars {{{
	if (g:colors_name == 'solarized' && exists('g:solarized_vars'))
		let s:using_solarized_vars=1
		let s:vars=g:solarized_vars

		if (mode() =~# '\v(n|no)')
			exe 'hi! StatusLine '.s:vars['fmt_none'].s:vars['fg_base1'].s:vars['bg_base02'].s:vars['fmt_revbb']
		elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block')
			exe 'hi! StatusLine'.s:vars['fmt_none'].s:vars['fg_green'].s:vars['bg_base02'].s:vars['fmt_revbb']
		elseif (mode() ==# 'i')
			exe 'hi! StatusLine'.s:vars['fmt_none'].s:vars['fg_red'].s:vars['bg_base02'].s:vars['fmt_revbb']
		else
			exe 'hi! StatusLine '.s:vars['fmt_none'].s:vars['fg_base1'].s:vars['bg_base02'].s:vars['fmt_revbb']
		endif

		return ''
	endif
	" }}}

	if (g:colors_name != 'solarized' || !exists('s:using_solarized_vars'))
		if (!exists('g:usefulstatusline_colorize_custom'))
			" Solarized definitions {{{

			" Set both gui and terminal color values in separate conditional statements
			" Due to possibility that CSApprox is running (though I suppose we could just
			" leave the hex values out entirely in that case and include only cterm colors)
			" We also check to see if user has set solarized (force use of the
			" neutral gray monotone palette component)
			if (has('gui_running') && g:solarized_degrade == 0)
				let s:vmode  = "gui"
				let s:base02 = "#073642"
				let s:base1  = "#93a1a1"
				let s:red    = "#dc322f"
				let s:green  = "#719e07" "experimental
			elseif (has('gui_running') && g:solarized_degrade == 1)
				" These colors are identical to the 256 color mode. They may be viewed
				" while in gui mode via "let g:solarized_degrade=1", though this is not
				" recommened and is for testing only.
				let s:vmode  = "gui"
				let s:base02 = "#262626"
				let s:base1  = "#8a8a8a"
				let s:red    = "#af0000"
				let s:green  = "#5f8700"
			elseif g:solarized_termcolors != 256 && &t_Co >= 16
				let s:vmode  = "cterm"
				let s:base02 = "0"
				let s:base1  = "14"
				let s:red    = "1"
				let s:green  = "2"
			elseif g:solarized_termcolors == 256
				let s:vmode  = "cterm"
				let s:base02 = "235"
				let s:base1  = "245"
				let s:red    = "124"
				let s:green  = "64"
			else
				let s:vmode  = "cterm"
				let s:bright = "* term=bold cterm=bold"
				let s:base02 = "Black"         " 0
				let s:base1  = "LightCyan"     " 6*
				let s:red    = "DarkRed"       " 1
				let s:green  = "DarkGreen"     " 2
			endif

			" Some Solarized colorscheme definitions
			let s:r = ',reverse'
			if (g:solarized_bold == 0 || &t_Co == 8 )
				let s:b  = ''
				let s:bb = ',bold'
			else
				let s:b  = ',bold'
				let s:bb = ''
			endif
			exe 'let s:fmt_none = " '.s:vmode.'=NONE'.' term=NONE'.'"'
			exe 'let s:fmt_revbb = " '.s:vmode.'=NONE'.s:r.s:bb.' term=NONE'.s:r.s:bb.'"'
			exe 'let s:bg_base02 = " '.s:vmode.'bg='.s:base02.'"'
			exe 'let s:fg_base1 = " '.s:vmode.'fg='.s:base1.'"'
			exe 'let s:fg_green = " '.s:vmode.'fg='.s:green.'"'
			exe 'let s:fg_red = " '.s:vmode.'fg='.s:red.'"'

			" }}}
		endif

		if (!exists('g:usefulstatusline_normal'))
			exe 'let g:usefulstatusline_normal="'.s:fmt_none.' '.s:vmode.'fg='.s:base1.' '.s:vmode.'bg='.s:base02.' '.s:fmt_revbb.'"'
		endif
		if (!exists('g:usefulstatusline_visual'))
			exe 'let g:usefulstatusline_visual="'.s:fmt_none.' '.s:vmode.'fg='.s:green.' '.s:vmode.'bg='.s:base02.' '.s:fmt_revbb.'"'
		endif
		if (!exists('g:usefulstatusline_insert'))
			exe 'let g:usefulstatusline_insert="'.s:fmt_none.' '.s:vmode.'fg='.s:red.' '.s:vmode.'bg='.s:base02.' '.s:fmt_revbb.'"'
		endif
		if (!exists('g:usefulstatusline_error'))
			let g:usefulstatusline_error=g:usefulstatusline_normal
		endif

		if(mode() =~# '\v(n|no)')
			exe 'hi! StatusLine '.g:usefulstatusline_normal
		elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block')
			exe 'hi! StatusLine '.g:usefulstatusline_visual
		elseif (mode() ==# 'i')
			exe 'hi! StatusLine '.g:usefulstatusline_insert
		else
			exe 'hi! StatusLine '.g:usefulstatusline_error
		endif
	endif

	return ''
endfunction
