#modloaded cyclicmagic
#loader mixin

#mixin Mixin
#{targets: "com.lothrazar.cyclicmagic.block.forester.TileEntityForester"}
zenClass MixinTileEntityForester {
    #mixin Inject
    #{
    #    method: "func_73660_a",
    #    at: {value: "HEAD"},
    #    cancellable: true
    #}
    function delayUpdate(ci as mixin.CallbackInfo) as void {
        if(this0.world.getWorldTime() % 11 != 0)
            ci.cancel();
    }
}
