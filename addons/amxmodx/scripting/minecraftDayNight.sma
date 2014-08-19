/* Script generated by Pawn Studio */

#include <amxmodx>
#include <amxmisc>

#include <engine>

#define PLUGIN	"New Plugin"
#define AUTHOR	"DarkGL"
#define VERSION	"1.0"

new pCvarTime;

new endLight = 'b';
new startLight = 'm';

new currentLight = 'm';

new rangeBettwenLights = 'm' - 'a';

public plugin_init(){
	
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	pCvarTime = register_cvar( "minecraftMod_time" , "60.0" );
	
	if( get_pcvar_float( pCvarTime ) != 0.0 ){
		
		setLightString( currentLight );
		
		set_task( get_pcvar_float( pCvarTime ) / float( rangeBettwenLights * 2 ) , "setLight" , .flags = "b" );
	}
}

public setLight(){
	static bool: decreasing = true;
	
	if( currentLight == endLight ){
		decreasing = false;
	}
	else if( currentLight == startLight ){
		decreasing = true;
	}
	
	if( decreasing ){
		currentLight -= 1;
	}
	else {
		currentLight += 1;
	}
	
	setLightString( currentLight );
}

setLightString( cChar ){
	new tmpStr[ 2 ];
	
	tmpStr[ 0 ] = cChar;
	tmpStr[ 1 ] = '^0';
	
	set_lights( tmpStr );
}