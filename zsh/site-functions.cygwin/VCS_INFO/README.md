faster-vcs-info for zsh
=======================

This makes zsh's vcs-info faster, especially on Cygwin.


Install
-------

Put files to a certain directory and add it on top of $fpath
to override the system's functions.


Tips
----

vcs-info keeps up with many VCSs. But checking many systems makes responses slow.
By default, vcs-info will use all known backends.

If you use only Mercurial or Git, and have more opportunities to work with Mercurial than Git,
you should do:

    zstyle ':vcs_info:*' enable hg git

`hg` should be preceded because vcs-info will check backends in written order.


License
-------

Same as zsh.


Author
------

Kouhei Yanagita <yanagi at shakenbu.org>.
