///draw_mask()
draw_set_color(c_yellow);
draw_set_alpha(.4);

draw_rectangle(
    (x -sprite_xoffset) + sprite_get_bbox_left(sprite_index),
    (y -sprite_yoffset) + sprite_get_bbox_top(sprite_index),
    (x -sprite_xoffset) + sprite_get_bbox_right(sprite_index),
    (y -sprite_yoffset) + sprite_get_bbox_bottom(sprite_index),
    false
    );
