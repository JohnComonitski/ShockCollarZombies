#using scripts\codescripts\struct;

#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\compass;
#using scripts\shared\exploder_shared;
#using scripts\shared\flag_shared;
#using scripts\shared\laststand_shared;
#using scripts\shared\math_shared;
#using scripts\shared\scene_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;

#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_load;
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_powerups;
#using scripts\zm\_zm_utility;
#using scripts\zm\_zm_weapons;
#using scripts\shared\laststand_shared;
#using scripts\shared\util_shared;
#using scripts\zm\_zm_blockers;
#using scripts\shared\system_shared;
#using scripts\zm\_zm_score;

#insert scripts\zm\_zm_perks.gsh;



#precache( "eventstring", "PainCount" );
#precache( "lui_menu", "EndgameMenu");

 
//*****************************************************************************
// MAIN
//*****************************************************************************

REGISTER_SYSTEM( "mod_jj25", &__init__, undefined )



#precache( "lui_menu", "EndgameMenu");

function __init__()
{
	callback::on_spawned(&on_player_spawn);


	//level flag::wait_till("initial_blackscreen_passed");
	//level.custom_intermission = &symbo_test;



	wait 5;
	machines = GetEntArray( "zombie_vending", "targetname" ); //disable jug
	foreach(machine in machines)
	{
		if (machine.script_noteworthy == PERK_JUGGERNOG)
		{
			machine TriggerEnable(0);
		}
	}

}



function symbo_test()
{
	level.zombie_vars["zombie_intermission_time"] = 69;

	wait 1;
	GetPlayers()[0] OpenMenu("EndgameMenu");

	wait 5;

	GetPlayers()[0] CloseMenu("EndgameMenu");

}






function on_player_spawn() //self = individual player
{
	
	//self zm_weapons::weapon_give(GetWeapon("ray_gun"));
 
	last_time = GetTime();
	intervals = 1000;


	while(1)
	{
		self waittill("damage", amount, attacker );

		if( IsAI(attacker) )
		{
			self LUINotifyEvent(&"PainCount");
			level notify("end_game");
		}

	}

}




