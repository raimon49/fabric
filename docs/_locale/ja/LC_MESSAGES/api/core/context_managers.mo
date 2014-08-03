Þ    ?        Y         p  f   q  :   Ø       Ó   ¯  K     I   Ï  ©     ¿   Ã  Ö   	     Z
  A   k
  @   ­
  =   î
  J   ,  5   w  &   ­  G   Ô  	     ;   &  m   b  s   Ð  ª   D     ï  a     ?   á  ª   !  B   Ì  ¹     ¡   É  8   k  a   ¤  ?     H   F      `   *       x          ¨   ¡  ^  J  $  ©    Î     é  z     ¡     Ù   ¤  *   ~  n   ©  s     W     S   ä  á   8  à     ³   û  j   ¯   	  !  <   $"  /   a"  `   "     ò"     #     1#    A#  j   Í$  H   8%  ã   %  "  e&  v   '  Q   ÿ'  Î   Q(  è    )  [  	*  $   e+  k   +  j   ö+  {   a,     Ý,  O   b-  B   ²-     õ-     }.  g   .     ë.  »   |/  Ô   80  ã   1     ñ1  x   {2  
  ô2  \   ÿ3    \4  Ã   x5  k   <6  v   ¨6  j   7  y   7    8  u   :  ¹   :  ×   <;     <  ì   <  Ð  
=  z  Û>  =  V@  Ë   A     `B  ê   þB  ó   éC  A   ÝD     E  ±   »E     mF  o   óF  +  cG  *  H    ºI     ÁJ  ±  XK  N   
M  :   YM     M  -   .N     \N  ,   {N     .          (   1           "   >       #   7       )   0      /       4                                +   3             ?              !         	   =                     2   <   $      ,       5                
   '   :             6             9       %   *                      ;   -             &               8       :ref:`env.warn_only <warn_only>`, `~fabric.context_managers.settings`, `~fabric.context_managers.hide` Alias to ``settings(hide('everything'), warn_only=True)``. Any calls to `run` or `sudo` within the wrapped block will implicitly have a string similar to ``"PATH=$PATH:<path> "`` prepended before the given command. Any calls to `run`, `sudo`, `get`, or `put` within the wrapped block will implicitly have a string similar to ``"cd <path> && "`` prefixed in order to give the sense that there is actually statefulness involved. Append the given ``path`` to the PATH used to execute any wrapped commands. Applies to `get` and `put` in addition to the command-running operations. Because use of `cd` affects all such invocations, any code making use of those operations, such as much of the ``contrib`` section, will also be affected by use of `cd`. Below is a "normal" attempt at using the shell 'cd', which doesn't work due to how shell-less SSH connections are implemented -- state is **not** kept between invocations of `run` or `sudo`:: By default, most SSH servers only allow remote tunnels to listen to the localhost interface (127.0.0.1). In these cases, `remote_bind_address` is ignored by the server, and the tunnel will listen only to 127.0.0.1. Context Managers Context manager for setting the given output ``groups`` to False. Context manager for setting the given output ``groups`` to True. Context manager for updating local current working directory. Context manager that keeps directory state when calling remote operations. Context managers for use with the ``with`` statement. Contrived, but hopefully illustrative. Create a tunnel forwarding a locally-visible port to the remote target. Example:: Finally, a demonstration (see inline comments) of nesting:: Finally, as alluded to near the beginning, `~fabric.context_managers.prefix` may be nested if desired, e.g.:: Finally, note that `~fabric.context_managers.settings` implements ``nested`` itself -- see its API doc for details. For example, one of the most common uses of this tool is with the ``workon`` command from `virtualenvwrapper <http://www.doughellmann.com/projects/virtualenvwrapper/>`_:: For example, to hide the "[hostname] run:" status lines, as well as preventing printout of stdout and stderr, one might use `hide` as follows:: For example, you can let the remote host access a database that is installed on the client host:: Force local terminal ``pipe`` be character, not line, buffered. If you are using multiple directly nested ``with`` statements, it can be convenient to use multiple context expressions in one single with statement. Instead of writing:: In the above snippet, the actual shell command run would be this:: Like the actual 'cd' shell builtin, `cd` may be called with relative paths (keep in mind that your default starting directory is your remote user's ``$HOME``) and may be nested as well. Most of the time, you'll want to be using this alongside a shell script which alters shell state, such as ones which export or alter shell environment variables. Nest context managers and/or override ``env`` variables. Note that you need Python 2.7+ for this to work. On Python 2.5 or 2.6, you can do the following:: Only applies on Unix-based systems; on Windows this is a no-op. Prefix all wrapped `run`/`sudo` commands with given command plus ``&&``. Relative path arguments are relative to the local user's current working directory, which will vary depending on where Fabric (or Fabric-using code) was invoked. You can check what this is with `os.getcwd <http://docs.python.org/release/2.6/library/os.html#os.getcwd>`_. It may be useful to pin things relative to the location of the fabfile in use, which may be found in :ref:`env.real_fabfile <real-fabfile>` Space characters will be escaped automatically to make dealing with such directory names easier. The above snippet will list the contents of the remote user's ``$HOME`` instead of ``/var/www``. With `cd`, however, it will work as expected:: The database might be installed on a client only reachable from the client host (as opposed to *on* the client itself):: The result:: This context manager is compatible with `~fabric.context_managers.cd`, so if your virtualenv doesn't ``cd`` in its ``postactivate`` script, you could do the following:: This context manager is currently implemented by appending to (and, as always, restoring afterwards) the current value of an environment variable, ``env.cwd``. However, this implementation may change in the future, so we do not recommend manually altering ``env.cwd`` -- only the *behavior* of `cd` will have any guarantee of backwards compatibility. This context manager is currently implemented by modifying (and, as always, restoring afterwards) the current value of environment variables, ``env.path`` and ``env.path_behavior``. However, this implementation may change in the future, so we do not recommend manually altering them directly. This context manager is identical to `~fabric.context_managers.cd`, except that it changes a different env var (`lcwd`, instead of `cwd`) and thus only affects the invocation of `~fabric.operations.local` and the local arguments to `~fabric.operations.get`/`~fabric.operations.put`. This is nearly identical to `~fabric.operations.cd`, except that nested invocations append to a list of command strings instead of modifying a single string. Useful for wrapping remote interrogative commands which you expect to fail occasionally, and/or which you want to silence. When used in a task, the above snippet will not produce any ``run: test -e /tmp/build`` line, nor will any stdout/stderr display, and command failure is ignored. When using Python 2.5, you will need to start your fabfile with ``from __future__ import with_statement`` in order to make use of the ``with`` statement (which is a regular, non ``__future__`` feature of Python 2.6+.) Which would result in executions like so:: You may customize the behavior of `path` by specifying the optional ``behavior`` keyword argument, as follows: ``'append'``: append given path to the current ``$PATH``, e.g. ``PATH=$PATH:<path>``. This is the default behavior. ``'prepend'``: prepend given path to the current ``$PATH``, e.g. ``PATH=<path>:$PATH``. ``'replace'``: ignore previous value of ``$PATH`` altogether, e.g. ``PATH=<path>``. ``groups`` must be one or more strings naming the output groups defined in `~fabric.state.output`. The given groups will be set to False for the duration of the enclosed block, and restored to their previous value afterwards. ``groups`` must be one or more strings naming the output groups defined in `~fabric.state.output`. The given groups will be set to True for the duration of the enclosed block, and restored to their previous value afterwards. ``local_host`` (optional) is the locally-reachable computer (DNS name or IP address) to connect to; the default is ``localhost`` (that is, the same computer Fabric is running on). ``local_port`` (optional) is the local port to connect to; the default is the same port as the remote one. ``remote_bind_address`` (optional) is the remote IP address to bind to for listening, on the current target. It should be an IP address assigned to an interface on the target (or a DNS name that resolves to such IP). You can use "0.0.0.0" to bind to all interfaces. ``remote_port`` (mandatory) is the remote port to listen to. ``remote_tunnel`` accepts up to four arguments: `cd` only affects *remote* paths -- to modify *local* paths, use `~fabric.context_managers.lcd`. `settings` serves two purposes: `~fabric.context_managers.lcd` you can write:: Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-08-03 17:46+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: LANGUAGE <tekapo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja
X-Generator: Poedit 1.6.7
 :ref:`env.warn_only <warn_only>`ã `~fabric.context_managers.settings`ã `~fabric.context_managers.hide` ``settings(hide('everything'), warn_only=True)``ã¸ã®ã¨ã¤ãªã¢ã¹ã ããã§å²ã¾ãããã­ãã¯åã® `run` ãããã¯ `sudo` ã«å¯¾ããã©ããªå¼ã³åºãããä¸ããããã³ãã³ãã®åã« ``"PATH=$PATH:<path> "`` ã«ä¼¼ãæå­åãæé»ã®ãã¡ã«è¿½å ããã¾ãã ããã§ã©ããããããã­ãã¯åã® `run`ã `sudo`ã `get`ã `put` ã¸ã®ã©ããªå¼ã³åºãããå®éã«ç¶æãç¶­æããã¦ããã¨ããæå³ãæãããããã« ``"cd <path> && "`` ãããªãã£ãã¯ã¹ãããã®ã¨ä¼¼ãæå­åãæã«å«ã¿ã¾ãã ã©ãããããã³ãã³ãå®è¡ããããã«ä½¿ããããã¹ã«ä¸ãããã ``path`` ãè¿½å ãã¾ãã ã³ãã³ãã§ã®æä½ã«å ãã `get` ã¨ `put` ã«ãé©ç¨ããã¾ãã	 `cd` ã®å©ç¨ã¯ãããããã¹ã¦ã®å®è¡ã«å½±é¿ãä¸ããã®ã§ã``contrib`` ã»ã¯ã·ã§ã³ã®å¤ããªã©ããããæä½ãè¡ãã³ã¼ããã¾ã `cd` ã®å©ç¨ã«å½±é¿ãåãã¾ãã ä¸ã®ä¾ã¯ã·ã§ã«ã® `cd` ãä½¿ã£ã "ãã¼ãã«ãª" è©¦ã¿ã§ã `run` ãããã¯ `sudo` ã®å®è¡ã¨å®è¡ã®éã®ç¶æãç¶­æ **ãããªã** ã¨ããã·ã§ã«ãªãSSHæ¥ç¶ã®å®è£ã®ããåä½ãã¾ããã ããã©ã«ãã§ã¯ãããã¦ãã®SSHãµã¼ãã¯ãªã¢ã¼ããã³ãã«ã«ã­ã¼ã«ã«ãã¹ãã®ã¤ã³ã¿ã¼ãã§ã¼ã¹(127.0.0.1)ããªãã¹ã³ãããã¨ããè¨±å¯ãã¦ãã¾ãããããããã±ã¼ã¹ã§ã¯`remote_bind_address`ã¯ãµã¼ãã¼ã«ãã£ã¦ç¡è¦ããããã³ãã«ã¯127.0.0.1ã ãããªãã¹ã³ãã¾ãã ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ ä¸ããããåºå ``groups`` ãFalseã«ã»ããããããã«ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã ä¸ããããåºå ``groups`` ãTrueã«ã»ããããããã«ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã ã­ã¼ã«ã«ã®ã«ã¬ã³ãã¯ã¼ã­ã³ã°ãã£ã¬ã¯ããªãæ´æ°ããããã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ãªã¢ã¼ãæä½ãå¼ã³åºãã¨ãã«ã¯ãã£ã¬ã¯ããªã®ç¶æãç¶­æãã¾ãã ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ ``with`` ã¨ã¨ãã«ä½¿ç¨ãã¾ãã ä¸èªç¶ããããã¾ããããèª¬æçã ã¨æãã¾ãã ã­ã¼ã«ã«ã®éãã¦ãããã¼ããããªã¢ã¼ãã®ã¿ã¼ã²ããã«ãã³ãã«ãã©ã¯ã¼ãã£ã³ã°ãä½æãã¾ãã ä¾:: æå¾ã«ããã¹ãã®ä¾(ã¤ã³ã©ã¤ã³ã®ã³ã¡ã³ãããè¦§ãã ãã)ããè¦ããã¾ã:: æå¾ã«ãåé ­è¿ãã§ç¤ºåããããã«ã`~fabric.context_managers.prefix` ã¯ãå¥½ã¿ã®ããã«ãã¹ãã§ãã¾ããä¾ãã°:: æå¾ã« `~fabric.context_managers.settings` ã¯ ``nested`` èªèº«ãå®è£ãã¦ãããã¨ã«çæãã¦ãã ãããè©³ããã¯ãã®APIãã­ã¥ã¡ã³ãããè¦§ãã ããã ä¾ãã°ããã®ãã¼ã«ã®ãã£ã¨ãä¸è¬çãªå©ç¨æ¹æ³ã®1ã¤ã¯ `virtualenvwrapper <http://www.doughellmann.com/projects/virtualenvwrapper/>`_ ããã® ``workon`` ã³ãã³ãã¨ä½¿ããã®ã§ã:: ä¾ãã°ã "[hostname] run:" ã®ã¹ãã¼ã¿ã¹ã©ã¤ã³ãé ããåãããã«æ¨æºåºåã¨æ¨æºã¨ã©ã¼åºåãè¡¨ç¤ºãããªãããã«ããã«ã¯ãæ¬¡ã®ããã« `hide` ãå©ç¨ãããã¨ãã§ãã¾ã:: ä¾ãã°ãã¯ã©ã¤ã¢ã³ããã¹ãã«ã¤ã³ã¹ãã¼ã«ãã¦ãããã¼ã¿ãã¼ã¹ã¸ãªã¢ã¼ãããã¢ã¯ã»ã¹ããã¾ã:: ã­ã¼ã«ã«ã¿ã¼ããã«ã® ``ãã¤ã`` ãè¡ãã¨ã§ã¯ãªãæå­ãã¨ã«å¼·å¶çã«ãããã¡ãã¾ãã ãã¤ã¬ã¯ãã«ãã¹ãããã¦ããè¤æ°ã® ``with`` ã¹ãã¼ãã¡ã³ããä½¿ç¨ããå ´åã1ã¤ã®withã¹ãã¼ãã¡ã³ãåã«è¤æ°ã®ã³ã³ãã­ã¹ãè¡¨ç¾ãç¨ããã»ããä¾¿å©ãªãã¨ãããã¾ããæ¬¡ã®ããã«æ¸ãä»£ããã«:: ä¸è¨ã®ä¾ã§ã¯ãå®éã®ã·ã§ã«ã³ãã³ãã®å®è¡ã¯ãã®ããã«ãªãã¾ã:: å®éã®ã·ã§ã«ãã«ãã¤ã³ã® `cd` ã®ããã«ã `cd` ã¯ç¸å¯¾ãã¹ã§å¼ã³åºããã¨ãã§ã(æåã®ãã£ã¬ã¯ããªã®ããã©ã«ãã¯ãªã¢ã¼ãã¦ã¼ã¶ã¼ã® ``$HOME`` ã§ãããã¨ã«æ°ãã¤ãã¦ãã ãã)ããã¹ããããã¨ãå¯è½ã§ãã ããã¦ãã®å ´åãã·ã§ã«ç°å¢å¤æ°ãã¨ã¯ã¹ãã¼ããããå¤æ´ãããããªãã·ã§ã«ã®ç¶æãå¤ããã·ã§ã«ã¹ã¯ãªããã¨ä¸ç·ã«ä½¿ãã¨ããã§ãããã ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ããã¹ãããã³/ãããã¯``env``å¤æ°ãä¸æ¸ããã¾ãã ãã®ããã«ããã«ã¯Python 2.7ä»¥ä¸ãå¿è¦ã§ããPython 2.5ãããã¯2.6ã§ã¯æ¬¡ã®ããã«ãã¾ã:: ã¦ããã¯ã¹ãã¼ã¹ã®ã·ã¹ãã ã®ã¿ã®é©ç¨ããã¾ããWindowsã§ã¯æä½ã§ãã¾ããã å²ã¾ãããã¹ã¦ã® `run`/`sudo` ã³ãã³ãã®åã«ãä¸ããããã³ãã³ãã¨ ``&&`` ãè¿½å ãã¾ãã ç¸å¯¾ãã¹ã®å¼æ°ã¯ã­ã¼ã«ã«ã¦ã¼ã¶ã¼ã®ã«ã¬ã³ãã®ã¯ã¼ã­ã³ã°ãã£ã¬ã¯ããªã«å¯¾ããç¸å¯¾ã«ãªããFabric(ãããã¯Fabricãä½¿ãã³ã¼ã)ãã©ãã§å®è¡ããããã«ãã£ã¦éã£ã¦ãã¾ããããã¯ `os.getcwd <http://docs.python.org/release/2.6/library/os.html#os.getcwd>`_ ã§ç¢ºèªã§ãã¾ããfabfileãå©ç¨ããã¦ããå ´æããã®ç¸å¯¾ã«åºå®ããã¨ä¾¿å©ããããã¾ãããããã¯ :ref:`env.real_fabfile <real-fabfile>` ã§ç¢ºèªã§ãã¾ãã ç©ºç½æå­ãå«ããã£ã¬ã¯ããªåãæ±ããããç©ºç½æå­ã¯èªåçã«ã¨ã¹ã±ã¼ãããã¾ãã ä¸ã®ä¾ã¯ ``/var/www`` ã§ã¯ãªãããªã¢ã¼ãã¦ã¼ã¶ã¼ã® ``$HOME`` ã®ã³ã³ãã³ãã®ä¸è¦§ãè¡¨ç¤ºãã¾ãã`cd` ã¨ã¨ãã«ä½¿ãã¨æå¾éãã«åä½ãã¾ã:: ãã¼ã¿ãã¼ã¹ã¯ãã¯ã©ã¤ã¢ã³ããã¹ãããã®ã¿æ¥ç¶å¯è½ãªã¯ã©ã¤ã¢ã³ãä¸ã«ã¤ã³ã¹ãã¼ã«ããã¦ããã¨ãã¾ã(ã¯ã©ã¤ã¢ã³ãèªèº«ã® *ä¸ã«* ããã®ã¨ã¯å¯¾ç§çã«):: çµæ:: ãã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ `~fabric.context_managers.cd` ã¨äºææ§ãããã®ã§ãããèªåã® virtualenv ããã® ``postactivate`` ã¹ã¯ãªããã§ ``cd`` ã§ããªãã¨ãã¯æ¬¡ããã«ãã§ãã¾ã:: ãã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ç°å¢å¤æ°ã®ã«ã¬ã³ãã®å¤ã ``env.cwd`` ã«è¿½å ãããã¨ã«ãã£ã¦å®è£ããã¦ãã¾ã(ããã¦ããã¤ãã®ããã«ãã®å¾ãã¨ã®ç¶æã«ãã©ãã¾ã)ãã¨ã¯è¨ãããã®å®è£ã¯å°æ¥çã«ã¯å¤æ´ãããããããã¾ããã®ã§ãæåã§ ``env.cwd`` ã«å¤æ´ãããã¨ã¯ãããããã¾ãããå¾æ¹äºææ§ãä¿è¨¼ããã®ã¯ `cd` ã® *æå* ã®ã¿ã§ãã ãã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ãç°å¢å¤æ° ``env.path`` ã¨ ``env.path_behavior`` ã®ã«ã¬ã³ãã®å¤ãå¤æ´ãã(ããã¦ãã¤ãã®ããã«ãã®å¾ã«åã«æ»ã)ããã«ä»ã¯å®è£ããã¦ãã¾ãããããããã®å®è£ã¯å°æ¥çã«ã¯å¤æ´ããããããããªãã®ã§ç´æ¥æåã§å¤æ´ãããã¨ã¯ãããããã¾ããã ãã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ã¯ `~fabric.context_managers.cd` ã¨åãã§ãããå¥ã®ç°å¢å¤æ°(`cwd` ã§ã¯ãªã `lcwd`)ãå¤æ´ããã®ã§ã `~fabric.operations.local` ã®å®è¡ã¨ `~fabric.operations.get`/`~fabric.operations.put` ã¸ã®ã­ã¼ã«ã«ã®å¼æ°ã®ã¿ã«å½±é¿ãä¸ãã¾ãã ããã¯ `~fabric.operations.cd` ã¨ã»ã¨ãã©åä¸ã§ããã1ã¤ã®æå­åãå¤æ´ããä»£ããã«ã³ãã³ãæå­åã®ãªã¹ãã«ããã¹ããããå¼ã³åºããè¿½å ããã¾ãã ææå¤±æãäºæããããã¤/ãããã¯ä½ãè¡¨ç¤ºãããããªãçåå½¢ã®ãªã¢ã¼ãã³ãã³ããã©ããããã¨ãã«ä¾¿å©ã§ãã ã¿ã¹ã¯åã§ä½¿ç¨ãããã¨ãä¸è¨ã¹ããããã¯ ``run: test -e /tmp/build`` ã®è¡ãçæãããã¾ããæ¨æºåºå/æ¨æºã¨ã©ã¼åºåã®ã¾ã£ããè¡¨ç¤ºããããã³ãã³ãã®å¤±æã¯ç¡è¦ããã¾ãã Python 2.5ã®å©ç¨æã ``with`` ã¹ãã¼ãã¡ã³ããå©ç¨ããããã«ã¯fabfileã ``from __future__ import with_statement`` ããå§ããå¿è¦ãããã¾ã(Python 2.6ä»¥ä¸ã§ã¯éå¸¸ã®é non ``__future__`` æ©è½ã§ã)ã ããã¯ãå®è¡æã«ã¯æ¬¡ã®ãããªçµæã«ãªãã¾ã:: æ¬¡ã®ããã«ããªãã·ã§ã³ã® ``behavior`` ã­ã¼ã¯ã¼ãå¼æ°ãæå®ãããã¨ã«ãã£ã¦ `path` ã®æåãã«ã¹ã¿ãã¤ãºã§ãã¾ã: ``'append'``: ã«ã¬ã³ãã® ``$PATH`` ã«ä¸ãããããã¹ãè¿½å ãã¾ããä¾ãã° ``PATH=$PATH:<path>`` ã§ããããã¯ããã©ã«ãã®æåã«ãªãã¾ãã ``'prepend'``: ã«ã¬ã³ãã® ``$PATH`` ã«ä¸ãããããã¹ãåã«è¿½å ãã¾ããä¾ãã° ``PATH=<path>:$PATH`` ã§ãã ``'replace'``: ``$PATH`` ã®åã®å¤ãå®å¨ã«ç¡è¦ãã¾ããä¾ãã° ``PATH=<path>`` ã¨ãªãã¾ãã ``groups`` ã¯ `~fabric.state.output` ã§å®ç¾©ãããåºåã°ã«ã¼ããå½åãã¦ãã1ã¤ä»¥ä¸ã®æå­åã§ãªããã°ãªãã¾ãããä¸ããããã°ã«ã¼ãã¯ãå²ã¾ãããã­ãã¯ã§ã®ç¶ç¶æ§ã®ããFalseã«ã»ããããããã®å¾ã¯åã®ç¶æã«æ»ãã¾ãã ``groups`` ã¯ `~fabric.state.output` ã§å®ç¾©ãããåºåã°ã«ã¼ããå½åãã¦ãã1ã¤ä»¥ä¸ã®æå­åã§ãªããã°ãªãã¾ãããä¸ããããã°ã«ã¼ãã¯ãå²ã¾ãããã­ãã¯ã§ã®ç¶ç¶æ§ã®ããTrueã«ã»ããããããã®å¾ã¯åã®ç¶æã«æ»ãã¾ãã ``local_host`` (ãªãã·ã§ã³) ã¯æ¥ç¶ããã­ã¼ã«ã«ã§å°éå¯è½ãªã³ã³ãã¥ã¼ã¿(DNSåãIPã¢ãã¬ã¹)ã§ããããã©ã«ãã¯``localhost``ã§ã(ããã¯ã¤ã¾ããFabricãåãã¦ããã®ã¨åãã³ã³ãã¥ã¼ã¿ã®ãã¨ã§ã)ã ``local_port`` (ãªãã·ã§ã³) ã¯æ¥ç¶ããã­ã¼ã«ã«ã®ãã¼ãã§ããããã©ã«ãã¯ãªã¢ã¼ãã®ãã¼ãã¨åããã¼ãã§ãã ``remote_bind_address`` (ãªãã·ã§ã³) ã¯ãã«ã¬ã³ãã¿ã¼ã²ããä¸ã®ãªãã¹ã³ããããã«ãã¤ã³ãããããã®ãªã¢ã¼ãã®IPã¢ãã¬ã¹ã§ããããã¯ã¿ã¼ã²ããä¸ã®ã¤ã³ã¿ã¼ãã§ã¼ã¹ã«å²ãå½ã¦ãããIPã§ããå¿è¦ãããã¾ã(ãããã¯ããããIPããªã¾ã«ãããDNSå)ããã¹ã¦ã®ã¤ã³ã¿ã¼ãã§ã¼ã¹ã«ãã¤ã³ãããã«ã¯ "0.0.0.0" ãä½¿ãã¾ãã ``remote_port`` (å¿é )ãªãã¹ã³ãããªã¢ã¼ããã¹ãã®ãã¼ãã ``remote_tunnel``ã¯4åã¾ã§ã®å¼ãæ°ãåãã¾ã: `cd` ã¯ *ãªã¢ã¼ã* ã®ãã¹ã§ã®ã¿ä½ç¨ãã¾ãã *ã­ã¼ã«ã«* ãã¹ãå¤æ´ããã«ã¯ `~fabric.context_managers.lcd` ãä½¿ãã¾ãã `settings`ã«ã¯2ã¤ã®ç®çãããã¾ã: `~fabric.context_managers.lcd` æ¬¡ã®ããã«æ¸ããã¨ãã§ãã¾ã:: 