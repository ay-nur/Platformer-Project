/// @desc Core Player Logic

//Get player inputs
key_left =  keyboard_check(vk_left) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);

// Is player on a wall
var onAWall = place_meeting(x+5, y, obj_nojumpwall) - place_meeting(x-5, y, obj_nojumpwall);
var onGround = place_meeting(x, y + 1, obj_wall) + place_meeting(x, y+1, obj_nojumpwall);


//Calculate movement
mvtLocked = max(mvtLocked -1, 0);


 
//if (alarm[0] <= 1){
    var _move = key_right - key_left;
    hsp = _move * walksp;
//}
//else {
//    show_debug_message("alarm[0] = " + string(alarm[0]))
//}


//Horizontal collision
if (place_meeting(x+hsp,y,obj_wall)) {
    while (!place_meeting(x+sign(hsp),y,obj_wall)) { 
        x = x + sign(hsp); 
        } 
    
    hsp = 0;
	}

if (place_meeting(x+hsp,y,obj_nojumpwall)) {
    while (!place_meeting(x+sign(hsp),y,obj_nojumpwall)) { 
        x = x + sign(hsp); 
        } 
    
    hsp = 0;
    }
	

// Jumping mechanic
if (mvtLocked <= 0) {
    if (onAWall != 0) vsp = min(vsp + 1, 5); 
    else vsp = vsp + grv;
            
    if (key_jump) {
        if (onGround) {
            vsp = -jumpsp;
	       }
        if (onAWall != 0) {
            vsp = -jumpsp;
            hsp = onAWall * -jumpsp*5;
            mvtLocked = 10;
        }
    }
}
x = x + hsp;

//Keep within the room
if (x < 32) x = 32; 
    
if (x > (room_width-32)) x = room_width-32;

//Vertical  collision
if (place_meeting(x,y+vsp,obj_wall)) { 
    while (!place_meeting(x,y+sign(vsp),obj_wall))  { 
        y = y + sign(vsp); 
    } 
    vsp = 0;
}

if (place_meeting(x,y+vsp,obj_nojumpwall)) { 
    while (!place_meeting(x,y+sign(vsp),obj_nojumpwall))  { 
        y = y + sign(vsp); 
    } 
    vsp = 0;
}
y = y + vsp;


	
//Animation
if (!place_meeting(x,y+1,obj_wall))  { 
    sprite_index = spr_jumpcard; 
    image_speed = 0; 
    if (vsp > 0) image_index = 1; else image_index = 0;
}

else { 
    image_speed = 1; 
    if (hsp == 0)  { 
        sprite_index = spr_idlecard; 
    } 
    else  { 
        sprite_index = spr_playercard; 
    }
}
if (hsp != 0) image_xscale = sign(hsp);

