/// @desc Establish key variables

hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 4;
jumpsp = 9;

StateFree = function()
{
	//Calculate movement
	var _move = key_right - key_left;

	hsp = _move * walksp;

	vsp = vsp + grv;

	if (place_meeting(x, y+1, obj_wall)) && (key_jump)
	{
		vsp = -jumpsp
	}

	//Horizontal collision
	if (place_meeting(x+hsp,y,obj_wall))
	{
		while (!place_meeting(x+sign(hsp),y,obj_wall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;
	//Keep within the room
	if (x < 32) x = 32;
	if (x > (room_width-32)) x = room_width-32;

	//Vertical  collision
	if (place_meeting(x,y+vsp,obj_wall))
	{
		while (!place_meeting(x,y+sign(vsp),obj_wall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;

	
	//Animation
	if (!place_meeting(x,y+1,obj_wall))
	{
		sprite_index = spr_jumpcard;
		image_speed = 0;
		if (vsp > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		image_speed = 1; 
		if (hsp == 0)
		{
			sprite_index = spr_idlecard;
		}
		else
		{
			sprite_index = spr_playercard;
		}
	}

	if (hsp != 0) image_xscale = sign(hsp);
}

state = StateFree;
