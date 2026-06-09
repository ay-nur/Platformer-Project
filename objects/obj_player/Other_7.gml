current_sprite = sprite_get_name(sprite_index);
upgrade_sprite = spr_upgradecard;

if (sprite_get_name(sprite_index) == "spr_upgradecard"){
    sprite_index = spr_playercard;
    instance_destroy(obj_upgrade);
}
