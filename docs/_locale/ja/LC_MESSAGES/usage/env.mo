Þ          4  ³   L                /  "   E  6   h  !         Á  "   â                :  &   M     t               ²     È     Þ     ó          #  *   7     b  '   s  
     
   ¦     ±     Î  #   ê  $        3     R  (   k  f        û          $  *   >  +   i  (        ¾  D   Î  .     /   B     r  ,        ¸     Å     Ü     ÷  Â   	  à   Ì  K  ­     ù       ÿ   2     2  }   H  7  Æ  Â   þ  '   Á  #   é       7     Ë   Ð  #     
  À  q   Ë    =  F   O         1     E     Z     h     {          ¢     ·     Ë     ×     ï     ÷                7     I     U     g     s       	             ¤     µ     ½     Ê     Ù     æ     ò              °         Î      Ü      å      ó      ü   
   !     !     $!     =!     R!  	   _!  	   i!     s!     !     !     ª!     º!     È!  	   ß!     é!     õ!     "     "  ë   "     #     #     %#     À#  ©  Ú#     %     ¢%  ?   À%  >    &  )   ?&  (   i&  *   &     ½&  (   Ù&     '  1   '     O'     k'     '     ¥'     Ã'     á'     þ'  #   (     >(  <   Z(     (  '   ¨(  
   Ð(  
   Û(     æ(     )  #   )  $   C)     h)     )  (    )  f   É)     0*     F*     Y*  *   s*  +   *  (   Ê*     ó*  D   +  .   H+  /   w+     §+  ,   À+     í+     ú+     ,     ,,    >,    [-  ¬  h.     0  '   .0    V0     k1  Æ   1  Ù  K2  -  %4  9   S5  ?   5  ©   Í5  K   w6    Ã6     á7  N  ù7     H9  ³  Ú9  e   ;  6  ô;     +>     ?>     T>     b>     u>     >     >     ±>     Å>     Ñ>     é>     ñ>     ?     ?     1?     C?     O?     a?     m?     }?  	   ?     ?     ?     ¯?     ·?     Ä?     Ó?     à?     ì?     ý?     
@    @     A     +A     4A     BA     KA  
   WA     bA     sA     A     ¡A  	   ®A  	   ¸A     ÂA     ÕA     éA     ùA     	B     B  	   .B     8B     DB     RB     eB  V  nB     ÅC     ÑC  Ò   ßC     ²D     8      )   i   9   f       *       6                   D   s             t   Y   P       T               d       z               ;      ^       ,       $   .      h          ]          7          0       2          5                 A   I           S   Q   (       E   H         M   =           V   '   -   ~      #   v   r       C   ?       c   K   x           w      !          >             R   F   L              U   +       3   b   B   [   J         %                     "   _   y   j   Z   @   p   G               &   4          l   |           }   o      `      N   O   k   a   <   W          /   
   :   u   \   	   X   n           m   {              g   1   q      e    **Default** ``False`` **Default**: ``True`` **Default:** User's local username **Default:** ``"sudo -S -p '%(sudo_prompt)s' " % env`` **Default:** ``"sudo password:"`` **Default:** ``$HOME/.fabricrc`` **Default:** ``$HOME/.ssh/config`` **Default:** ``''`` **Default:** ``/bin/bash -l -c`` **Default:** ``0`` **Default:** ``0`` (i.e. no keepalive) **Default:** ``10`` **Default:** ``1`` **Default:** ``False`` **Default:** ``None`` **Default:** ``True`` **Default:** ``[0]`` **Default:** ``[]`` **Default:** ``fabfile.py`` **Default:** ``{}`` **Default:** current Fabric version string :doc:`execution` :doc:`execution`, :option:`--user <-u>` :doc:`fab` :doc:`ssh` :option:`--abort-on-prompts` :option:`--command-timeout` :option:`--config <-c>`, :doc:`fab` :option:`--fabfile <-f>`, :doc:`fab` :option:`--forward-agent <-A>` :option:`--gateway <-g>` :option:`--hosts <-H>`, :doc:`execution` :option:`--initial-password-prompt <-I>`, :ref:`env.passwords <passwords>`, :ref:`password-management` :option:`--keepalive` :option:`--no-pty` :option:`--no_agent <-a>` :option:`--parallel <-P>`, :doc:`parallel` :option:`--pool-size <-z>`, :doc:`parallel` :option:`--roles <-R>`, :doc:`execution` :option:`--set` :option:`--skip-bad-hosts`, :ref:`excluding-hosts`, :doc:`execution` :option:`--ssh-config-path`, :ref:`ssh-config` :option:`--timeout`, :ref:`connection-attempts` :option:`--version <-V>` :option:`--warn-only <-w>`, :doc:`execution` :option:`-k` :ref:`linewise-output` :ref:`password-management` :ref:`ssh-config` A simple but integral aspect of Fabric is what is known as the "environment": a Python dictionary subclass, which is used as a combination settings registry and shared inter-task data namespace. As mentioned, the ``env`` object is simply a dictionary subclass, so your own fabfile code may store information in it as well. This is sometimes useful for keeping state between multiple tasks within a single execution run. Below is a list of all predefined (or defined by Fabric itself during execution) environment variables. While many of them may be manipulated directly, it's often best to use `~fabric.context_managers`, either generally via `~fabric.context_managers.settings` or via specific context managers such as `~fabric.context_managers.cd`. Environment as configuration Environment as shared state For example, there are many situations where setting ``warn_only`` (see below) is useful. To apply it to a few lines of code, use ``settings(warn_only=True)``, as seen in this simplified version of the ``contrib`` `~fabric.contrib.files.exists` function:: Full list of env vars In future versions, Fabric will become threadsafe, at which point ``env`` may be the only easy/safe way to keep global state. In many situations, it's useful to only temporarily modify ``env`` vars so that a given settings change only applies to a block of code. Fabric provides a `~fabric.context_managers.settings` context manager, which takes any number of key/value pairs and will use them to modify ``env`` within its wrapped block. Most of Fabric's behavior is controllable by modifying ``env`` variables, such as ``env.hosts`` (as seen in :ref:`the tutorial <defining-connections>`). Other commonly-modified env vars include: Network connection timeout, in seconds. Remote command timeout, in seconds. See the :doc:`../api/core/context_managers` API documentation for details on `~fabric.context_managers.settings` and other, similar tools. The `~fabric.context_managers.settings` context manager The environment dict is currently implemented as a global singleton, ``fabric.state.env``, and is included in ``fabric.api`` for convenience. Keys in ``env`` are sometimes referred to as "env variables". The environment dictionary, ``env`` The fact that it's a dictionary can be useful in other ways, such as with Python's ``dict``-based string interpolation, which is especially handy if you need to insert multiple env vars into a single string. Using "normal" string interpolation might look like this:: There are a number of other env variables; for the full list, see :ref:`env-vars` at the bottom of this document. This aspect of ``env`` is largely historical: in the past, fabfiles were not pure Python and thus the environment was the only way to communicate between tasks. Nowadays, you may call other tasks or subroutines directly, and even keep module-level shared state if you wish. Using dict-style interpolation is more readable and slightly shorter:: While it subclasses ``dict``, Fabric's ``env`` has been modified so that its values may be read/written by way of attribute access, as seen in some of the above material. In other words, ``env.host_string`` and ``env['host_string']`` are functionally identical. We feel that attribute access can often save a bit of typing and makes the code more readable, so it's the recommended way to interact with ``env``. ``abort_exception`` ``abort_on_prompts`` ``all_hosts`` ``always_use_pty`` ``colorize_errors`` ``combine_stderr`` ``command_prefixes`` ``command_timeout`` ``command`` ``connection_attempts`` ``cwd`` ``dedupe_hosts`` ``disable_known_hosts`` ``eagerly_disconnect`` ``exclude_hosts`` ``fabfile`` ``forward_agent`` ``gateway`` ``host_string`` ``host`` ``hosts`` ``keepalive`` ``key_filename`` ``key`` ``linewise`` ``local_user`` ``no_agent`` ``no_keys`` ``ok_ret_codes`` ``parallel`` ``password`` ``password``: Used to explicitly set your default connection or sudo password if desired. Fabric will prompt you when necessary if this isn't set or doesn't appear to be valid. ``passwords`` ``path`` ``pool_size`` ``port`` ``prompts`` ``rcfile`` ``real_fabfile`` ``reject_unknown_hosts`` ``remote_interrupt`` ``roledefs`` ``roles`` ``shell`` ``skip_bad_hosts`` ``ssh_config_path`` ``sudo_prefix`` ``sudo_prompt`` ``sudo_user`` ``system_known_hosts`` ``tasks`` ``timeout`` ``use_shell`` ``use_ssh_config`` ``user`` ``user``: Fabric defaults to your local username when making SSH connections, but you can use ``env.user`` to override this if necessary. The :doc:`execution` documentation also has info on how to specify usernames on a per-host basis. ``version`` ``warn_only`` ``warn_only``: a Boolean setting determining whether Fabric exits when detecting errors on the remote end. See :doc:`execution` for more on this behavior. `~fabric.operations.sudo` Project-Id-Version: Fabric 1.8
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-02-15 23:24+0900
PO-Revision-Date: 2014-04-01 18:49+0900
Last-Translator: JOTAKI, Taisuke <tekapo@gmail.com>
Language-Team: LANGUAGE <tekapo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
Language: ja
X-Generator: Poedit 1.6.4
X-Poedit-SourceCharset: UTF-8
 **ããã©ã«ã** ``False`` **ããã©ã«ã**: ``True`` **ããã©ã«ã:** ã¦ã¼ã¶ã¼ã®ã­ã¼ã«ã«ã¦ã¼ã¶ã¼å **ããã©ã«ã:** ``"sudo -S -p '%(sudo_prompt)s' " % env`` **ããã©ã«ã:** ``"sudo password:"`` **ããã©ã«ã:** ``$HOME/.fabricrc`` **ããã©ã«ã:** ``$HOME/.ssh/config`` **ããã©ã«ã:** ``''`` **ããã©ã«ã:** ``/bin/bash -l -c`` **ããã©ã«ã:** ``0`` **ããã©ã«ã:** ``0`` (ä¾: keepaliveç¡ã) **ããã©ã«ã:** ``10`` **ããã©ã«ã:** ``1`` **ããã©ã«ã:** ``False`` **ããã©ã«ã:** ``None`` **ããã©ã«ã:** ``True`` **ããã©ã«ã:** ``[0]`` **ããã©ã«ã:** ``[]`` **ããã©ã«ã:** ``fabfile.py`` **ããã©ã«ã:** ``{}`` **ããã©ã«ã:** Fabricã®ç¾è¡ãã¼ã¸ã§ã³æå­å :doc:`execution` :doc:`execution`, :option:`--user <-u>` :doc:`fab` :doc:`ssh` :option:`--abort-on-prompts` :option:`--command-timeout` :option:`--config <-c>`, :doc:`fab` :option:`--fabfile <-f>`, :doc:`fab` :option:`--forward-agent <-A>` :option:`--gateway <-g>` :option:`--hosts <-H>`, :doc:`execution` :option:`--initial-password-prompt <-I>`, :ref:`env.passwords <passwords>`, :ref:`password-management` :option:`--keepalive` :option:`--no-pty` :option:`--no_agent <-a>` :option:`--parallel <-P>`, :doc:`parallel` :option:`--pool-size <-z>`, :doc:`parallel` :option:`--roles <-R>`, :doc:`execution` :option:`--set` :option:`--skip-bad-hosts`, :ref:`excluding-hosts`, :doc:`execution` :option:`--ssh-config-path`, :ref:`ssh-config` :option:`--timeout`, :ref:`connection-attempts` :option:`--version <-V>` :option:`--warn-only <-w>`, :doc:`execution` :option:`-k` :ref:`linewise-output` :ref:`password-management` :ref:`ssh-config` Fabricã®ã·ã³ãã«ã ããã©ãä¸å¯æ¬ ãªå´é¢ã¯ "(ç°å¢)environment" ã¨ãã¦ç¥ããã¦ãããã®ã§ããããã¯Pythonã®è¾æ¸ãµãã¯ã©ã¹ã§ãè¨­å®ã¬ã¸ã¹ããªã®çµã¿åããã¨ãã¦å©ç¨ãããã¿ã¹ã¯éã®ãã¼ã¿ç©ºéã§å±æããã¾ãã åè¿°ã®ã¨ããã ``env`` ãªãã¸ã§ã¯ãã¯åç´ãªè¾æ¸ãµãã¯ã©ã¹ã§ãèªåã®fabfileã³ã¼ãã«ãä¿ç®¡ãããã¨ãã§ãã¾ããããã¯åä¸ã®å®è¡åã«è¤æ°ã®ã¿ã¹ã¯éã§ç¶æãä¿æããã®ã«ä¾¿å©ãªãã¨ãæãã¾ãã ä»¥ä¸ã¯å®ç¾©æ¸ã¿ã®(ãããã¯å®è¡ä¸­ã«Fabricèªèº«ã«ãã£ã¦å®ç¾©ããã)ãã¹ã¦ã®ç°å¢å¤æ°ã®ãªã¹ãã§ãããã®åã®å¤ãã¯ç´æ¥æä½ã§ãã¾ãããéå¸¸ã¯ `~fabric.context_managers.settings` çµç±ãããã¯ `~fabric.context_managers.cd` ãªã©ã®ç¹å®ã®ã³ã³ãã­ã¹ãããã¼ã¸ã£çµç±ã§ `~fabric.context_managers` ãä½¿ãã»ããå¤ãã®å ´åã¯ãã¹ãã§ãããã è¨­å®ã¨ãã¦ã®ç°å¢ å±æãããç¶æã¨ãã¦ã®ç°å¢ ä¾ãã°ã ``warn_only`` (ä¸ãåç§)è¨­å®ãä¾¿å©ãªç¶æ³ã¯ããããããã¨æãã¾ãããããä½è¡ãã®ã³ã¼ãã«é©ç¨ããã«ã¯ ``contrib`` `~fabric.contrib.files.exists` é¢æ°ã«ããããã«ã ``settings(warn_only=True)`` ãä½¿ãã¾ãã:: envå¤æ°ã®å¨ãªã¹ã å°æ¥ã®ãã¼ã¸ã§ã³ã§ã¯ãFabricã¯ã¹ã¬ããã»ã¼ãã«ãªãããã®æç¹ã§ ``env`` ã¯ã°ã­ã¼ãã«ãªç¶æãä¿æããå¯ä¸ã®ç°¡åã§å®å¨ãªæ¹æ³ã«ãªãã§ãããã å¤ãã®ã±ã¼ã¹ã§ãä¸æçã« ``env`` å¤æ°ã®å¤æ´ãã§ãã¦ãä¸ããããè¨­å®å¤æ´ãããã³ã¼ããã­ãã¯ã ãã«é©ç¨ãããæ¹ãä¾¿å©ãªãã¨ããã¾ããFabricã¯ `~fabric.context_managers.settings` ã³ã³ãã­ã¹ãããã¼ã¸ã£ãæä¾ãã¦ãã¾ããããã¯ä»»æã®æ°ã®ã­ã¼/ããªã¥ã¼ã®ãã¢ãåããã¨ãã§ããããã§ã©ããããããã­ãã¯åã® ``env`` ãå¤æ´ããã®ã«å©ç¨ã§ãã¾ãã Fabricã®ã»ã¨ãã©ã®æåã¯ ``env`` å¤æ°ãä¾ãã° :ref:`ãã¥ã¼ããªã¢ã« <defining-connections>` ã§è¦ããã ``env.hosts`` ãªã©ãå¤æ´ãããã¨ã«ãã£ã¦ã³ã³ãã­ã¼ã«ããã¾ããããå¤æ´ããã¦å©ç¨ããã ``env``  å¤æ°ã¯ä»¥ä¸ã®ãã®ãããã¾ã: ãããã¯ã¼ã¯æ¥ç¶ã®ã¿ã¤ã ã¢ã¦ããç§ã§ã ãªã¢ã¼ãã³ãã³ãã®ã¿ã¤ã ã¢ã¦ããç§ã§æå®ã `~fabric.context_managers.settings` ã¨ãã®ä»é¡ä¼¼ã®ãã¼ã«ã«é¢ããè©³ç´°ã¯ :doc:`../api/core/context_managers` APIãã­ã¥ã¡ã³ãããè¦§ãã ããã `~fabric.context_managers.settings` ã®ã³ã³ãã­ã¹ãããã¼ã¸ã£ã¼ ãã®ç°å¢è¾æ¸ã¯ã°ã­ã¼ãã«ãªã·ã³ã°ã«ãã³ã ``fabric.state.env`` ã¨ãã¦ç¾å¨ã¯å®è£ããã¦ãã¦ãä¾¿å©ãªããã« ``fabric.api`` åã«å«ã¾ãã¦ãã¾ãã ``env`` ã®ã­ã¼ã¯ "env variables(ç°å¢å¤æ°)" ã¨ãã¦è¨åãããã¨ãããã¾ãã ç°å¢è¾æ¸ã ``env`` ãããè¾æ¸ã§ããã¨ãããã¨ã¯ãPythonã® ``è¾æ¸`` ãã¼ã¹ã®æå­åæ¿å¥ãªã©ã®ä»ã®å ´åã«æçã«ãªããã¾ããããã¯ç¹ã«ãåä¸ã®æå­åã«è¤æ°ã® env å¤æ°ãæ¿å¥ããå¿è¦ãããã¨ãã«ã¨ã¦ãä¾¿å©ã§ãã"éå¸¸ã®" æå­åæ¿å¥ã®å©ç¨ã¯æ¬¡ã®ãããªãã®ã§ã:: ä»ã«ãããããã® env å¤æ°ãæãã¾ããå®å¨ãªä¸è¦§ã¯ãã®ãã­ã¥ã¡ã³ãã®ä¸ã :ref:`env-vars` ããè¦§ãã ããã ``env`` ã®ãã®å´é¢ã¯å¤åã«æ­´å²çãªãã®ã§ããä»¥åã¯ãfabfileã¯ç´ç²ãªPythonã§ã¯ããã¾ããã§ããã®ã§ããã®ãç°å¢ããã¿ã¹ã¯éã§ããã¨ãããããã®å¯ä¸ã®æ¹æ³ã§ãããç¾å¨ã§ã¯ãä»ã®ã¿ã¹ã¯ããµãã«ã¼ãã³ããã¤ã¬ã¯ãã«å¼ã³åºããã¨ãã§ããå¿è¦ãªãã¢ã¸ã¥ã¼ã«ã¬ãã«ã§ã®å±æãããç¶æãä¿æãããã¨ããã§ãã¾ãã è¾æ¸ã¹ã¿ã¤ã«ã®æ¿å¥ãå©ç¨ããã¨ããèª­ã¿ããããå°ãã ãç­ããªãã¾ã:: ããã¯ ``dict`` ã®ãµãã¯ã©ã¹ã§ããä¸æ¹ãFabricã® ``env`` ã¯å¤æ´ããã¦ãã¦ãããã¾ã§ã®ä¾ç­ã®ããã¤ãã«è¦ããããããå±æ§ã¢ã¯ã»ã¹ã®æ¹æ³ã§ãã®å¤ãèª­ã¿æ¸ãã§ãã¾ããè¨ãæããã¨ã ``env.host_string`` ã¨ ``env['host_string']`` ã¯æ©è½çã«åä¸ã§ããå±æ§ã¢ã¯ã»ã¹ã¯ã¿ã¤ãã³ã°ãå°ãã ãã§ããç¯ç´ã§ãããã¨ãããããã¾ãããã³ã¼ããããèª­ã¿ããããã¾ãããªã®ã§ã ``env`` ã¨ã®ããã¨ãã«ã¯ãã®æ¹æ³ããããããã¾ãã  ``abort_exception`` ``abort_on_prompts`` ``all_hosts`` ``always_use_pty`` ``colorize_errors`` ``combine_stderr`` ``command_prefixes`` ``command_timeout`` ``command`` ``connection_attempts`` ``cwd`` ``dedupe_hosts`` ``disable_known_hosts`` ``eagerly_disconnect`` ``exclude_hosts`` ``fabfile`` ``forward_agent`` ``gateway`` ``host_string`` ``host`` ``hosts`` ``keepalive`` ``key_filename`` ``key`` ``linewise`` ``local_user`` ``no_agent`` ``no_keys`` ``ok_ret_codes`` ``parallel`` ``password`` ``password``: å¿è¦ã«å¿ãã¦ããã©ã«ãæ¥ç¶ãsudoã®ãã¹ã¯ã¼ããè¨­å®ããããã«ä½¿ç¨ãã¾ããFabricã¯ããã®å¤ãè¨­å®ããã¦ããªãå ´åãæ­£ãããªãå ´åã«å¿è¦ã«ãªã£ãæã«ãã­ã³ãããè¡¨ç¤ºãã¾ãã ``passwords`` ``path`` ``pool_size`` ``port`` ``prompts`` ``rcfile`` ``real_fabfile`` ``reject_unknown_hosts`` ``remote_interrupt`` ``roledefs`` ``roles`` ``shell`` ``skip_bad_hosts`` ``ssh_config_path`` ``sudo_prefix`` ``sudo_prompt`` ``sudo_user`` ``system_known_hosts`` ``tasks`` ``timeout`` ``use_shell`` ``use_ssh_config`` ``user`` ``user``: SSHæ¥ç¶ãå®è¡ããã¨ãã®Fabricã®ããã©ã«ãã®å¤ã¯ãèªåã®ã­ã¼ã«ã«ã¦ã¼ã¶ã¼åã§ãå¿è¦ãªã ``env.user`` ãä½¿ã£ã¦ãªã¼ãã¼ã©ã¤ãã§ãã¾ããã¾ãããã­ã¥ã¡ã³ãã® :doc:`execution` ã«ã¯ãã¹ããã¨ã«ã¦ã¼ã¶ã¼åãæå®ããããã®æå ±ãè¨è¼ããã¦ãã¾ãã ``version`` ``warn_only`` ``warn_only``: ãªã¢ã¼ãå´ã§ã¨ã©ã¼ãæ¤ç¥ããã¨ãã«Fabricãçµäºãããã©ãããæ±ºãããã¼ã«è¨­å®ã§ãããã®æåã«é¢ããè©³ç´°ã¯ :doc:`execution` ããè¦§ãã ããã `~fabric.operations.sudo` 