clean-dev-tools
===============

A collection of scripts for programming Clean on Linux or similar.

How to use
----------

    $ cd /path/to/your/clean/project
    $ /path/to/clean-dev-tools/clean-ide
    # a new terminal opens
    $ gvim main.icl
    # hack hack hack
    $ clean main.prj

clean-ide
---------

Starts a terminal with various environment variables set.
In this terminal you can use the commands described below.
From this terminal you should start your editor.

Configuration happens inside the script clean-ide. Modify it to your taste.


cgr
---

Clean grep. A wrapper around recursive grep that only searches clean source
files, and ignores Clean System Files and various source control directories.

    $ cgr addNotification
    ./main.icl:32:  , publish "/headquarters" (\_ -> forever (makeNotification >>= addNotification))
    ./tasks.dcl:72:addNotification :: Notification -> Task()
    ./tasks.icl:28:addNotification :: Notification -> Task()
    ./tasks.icl:29:addNotification a = upd ( \ ns -> ns ++ [a]) notifications @!()

To be used standalone or from within vim.

    " Put this somewhere in your vim config
    " Press <Enter> to grep for the word under the cursor
    set grepprg=cgr
    nmap <buffer> <cr> :match green /\<<C-R>=expand("<cword>")<CR>\>/<CR>
      \ :silent grep \\\<<C-R>=expand("<cword>")<CR>\\\><CR>:redraw!<CR>


clean
-----

A wrapper around cpm, the clean project manager.
Mangles error messages and filters the overly verbose output of the compiler.
Exits with 0 on success and 1 on error, like a normal program.
Enables idioms like

    clean test.prj && ./test

To see how error messages are filtered, see filter_clean_crap.grep
The exit code is based on whether after this filter there are any messages.
If there is some compiler output that I forgot to filter, amend this file appropriately.

clean tees error messages to errors.err, so if you have the correct error format set
(see [vim-clean][norm2782-vim-clean] and its various forks) you can :cfile in
vim to source the compile errors.

    $ clean main.prj 
    Warning [main.icl,298,getOS]:   alternative will never match
    Type error [main.icl,383,foo]:"argument 1 of + : True" cannot unify demanded type with offered type:
     Int
     Bool
    # in vim, do a :cfile to load the error messages

[norm2782-vim-clean]: https://github.com/norm2782/vim-clean
