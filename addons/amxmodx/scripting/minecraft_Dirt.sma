/* Script generated by Pawn Studio */

#include <amxmodx>
#include <amxmisc>

#include <minecraft.inc>

#define PLUGIN	"New Plugin"
#define AUTHOR	"DarkGL"
#define VERSION	"1.0"

new const vModel[]	=	"models/minecraft/dirt/model_rece_dirt.mdl";
new const pModel[]	=	"models/p_knife.mdl";

new const normalModel[]	=	"models/minecraft/dirt/model_dirt.mdl";
new const littleModel[]	=	"models/minecraft/dirt/model_dirt_little.mdl";

new const soundPut[] = "minecraft/grass1.wav";
new const soundDestroy[] = "minecraft/grass1.wav";
new const soundDestroying[] = "minecraft/grass1.wav";

public plugin_init(){
	
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	registerNewObject( "Dirt" , 64 , CAN_DROP , 50 );
}

public plugin_precache(){
	precache_model( vModel );
	precache_model( pModel );
	precache_model( normalModel );
	precache_model( littleModel );
	
	precache_sound( soundPut );
	precache_sound( soundDestroy );
	precache_sound( soundDestroying );
}

public minecraftMod_V_Model( szModel[] , maxLen ){
	copy( szModel , maxLen , vModel );
}

public minecraftMod_P_Model( szModel[] , maxLen ){
	copy( szModel , maxLen , pModel );
}

public minecraftMod_Normal_Model( szModel[] , maxLen ){
	copy( szModel , maxLen , normalModel );
}

public minecraftMod_Little_Model( szModel[] , maxLen ){
	copy( szModel , maxLen , littleModel );
}

public Float:minecraftMod_primaryDamage(){
	return 10.0;
}

public structSecondary: minecraftMod_secondaryAction(){
	return CREATE_BLOCK;
}

public minecraftMod_SoundPut( szSound[] , maxLen ){
	copy( szSound , maxLen , soundPut );
}

public minecraftMod_SoundDestroy( szSound[] , maxLen ){
	copy( szSound , maxLen , soundDestroy );
}

public minecraftMod_SoundDestroying( szSound[] , maxLen ){
	copy( szSound , maxLen , soundDestroying );
}