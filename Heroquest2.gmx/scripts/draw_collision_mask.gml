///draw_mask()
draw_set_color(c_yellow);
draw_set_alpha(1);

draw_rectangle(
    bbox_left,
    bbox_top,
    bbox_right,
    bbox_bottom,
    true
);
/*
    (x -sprite_xoffset) + bbox_left,//sprite_get_bbox_left(sprite_index),
    (y -sprite_yoffset) + bbox_top,//sprite_get_bbox_top(sprite_index),
    (x -sprite_xoffset) + bbox_right,//sprite_get_bbox_right(sprite_index),
    (y -sprite_yoffset) + bbox_bottom,//sprite_get_bbox_bottom(sprite_index),
    true
    );
