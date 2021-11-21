///draw_path_ext();

if  (path_position > 0)
and (path_position < 1)
{
    draw_set_color(c_red);
    draw_set_alpha(1);
    draw_path(myPath, x, y, true);
}
