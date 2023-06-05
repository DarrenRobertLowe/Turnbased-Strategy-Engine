///setup_particles_fire(depth, size);
pdepth  = argument0;
size    = argument1;

global.partsys_fire = part_system_create();
part_system_depth(global.partsys_fire, pdepth);


global.part_fire = part_type_create();
part_type_sprite(global.part_fire, spr_fire, 0, 0, 1);
part_type_size(global.part_fire, .25, .5, -.05 ,0);
part_type_orientation(global.part_fire, 0, 360, 2, 0, 0);
part_type_color2(global.part_fire, c_orange, c_red);
part_type_alpha3(global.part_fire, 1, 1, 0);
part_type_blend(global.part_fire, 1);

// without the following movement, the fire will look more like lava.
part_type_direction(global.part_fire, 85, 95, 0, 0);
part_type_speed(global.part_fire, 5, 10, -.99, 0); // min and max makes it taller

// lifespan
part_type_life(global.part_fire, 10, 20);





/// Add cinders
global.part_cinder = part_type_create();
part_type_sprite(global.part_cinder,spr_part_cinder,0,0,1);
part_type_size(global.part_cinder,.25,.5,-.001,0);//.5,.75,-.001,0);
part_type_orientation(global.part_cinder,0,360,.05,0,0);
part_type_color2(global.part_cinder,c_orange,c_red);
part_type_alpha3(global.part_cinder,1,1,0);
part_type_blend(global.part_cinder,1);
part_type_direction(global.part_cinder,85,125,.01,.01);
part_type_speed(global.part_cinder,6,8,0,0);
part_type_life(global.part_cinder,45,75);
