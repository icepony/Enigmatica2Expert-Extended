# v1.30.1 (2024-2-5)


## 🐛 Fixes

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/d58d41b7ce4e28d5a54b1229160c2d15a44a239d)🐛Undo Random Patches `timeouts` section
  > Players reported that they cant connect servers on high ping

#### Quest

* <img src="https://i.imgur.com/Yl1Fezn.png" align=right> [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/52ec5b66cb3e5f0e36c189067c9e9e2072610a25)📖Temporary fix ![](https://github.com/Krutoy242/mc-icons/raw/master/i/fluid/copper.png "Molten Copper") cant be cast
  > After recent disabling Clay Casts, players would be unable to cast their first Copper Ore into sharpening kit or pickaxe head.
  > 
  > This temporary fix will add Brass cast as reward in `Mining Level 1` quest, so players could use it.
  > 
  > Later i will come up with better solution.

#### Server

* [🖇](https://github.com/Krutoy242/Enigmatica2Expert-Extended/commit/e8d49ec02e1be0ed2ce836f7924d9802eb00ba32)💻Remove auto-restart from serverSetup
  > Since most server services have auto-restart feature, it would have more sense to disable this feature from ServerStarter script.
  > 
  > ⚠ Note: if you run server on local machine or your server doesnt have auto-restart feature, you need to manually enable this option.



