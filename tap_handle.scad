inside_hole		= 8.4;
inside_depth	= 16;
bottom_dia		= 16;
top_dia			= 22;
handle_height	= 70;
magnet_height	= 2.2;
magnet_width	= 10.6;
sides			= 50;


include <threads.scad>


module handle() {
	difference() {
		difference() {
			union() {
				cylinder(r1=bottom_dia/2, r2=top_dia/2, h=handle_height-0.5, center=true, $fn=sides);
				translate([0, 0, handle_height/2]) cylinder(r1=top_dia/2, r2=top_dia/2-0.5, h=0.5, center=true, $fn=sides);
			}

			translate([0, 0, handle_height/2-0.3]) cylinder(r1=18.8/2, r2=19.4/2, h=5, center=true, $fn=sides);
			translate([0, 0, handle_height/2-4]) cylinder(r=magnet_width/2,  h=2.4, center=true, $fn=sides);
			translate([0, 0, -handle_height/2]) metric_thread(diameter=9.5250+1.2, pitch=1.5875, length=inside_depth, internal=true, n_starts=1);
		}

		translate([0, 0, -handle_height/2+inside_depth/2]) cylinder(r=inside_hole/2, h=inside_depth, center=true, $fn=sides);
		translate([0, 0, -handle_height/2+4]) cylinder(r1=inside_hole/2+1, r2=3, h=8, center=true, $fn=sides);

	}
}


module puck(my_text="") {
	difference() {
		cylinder(r=8.8, h=4, center=true);
		translate([0, 0, 1]) linear_extrude(height = 2) {
			text(my_text, size = 12, valign="center", halign="center");
		}
		translate([0, 0, -1]) cylinder(r=magnet_width/2, h=magnet_height, center=true);
		translate([0, 10, -1.20]) rotate([60, 0, 0]) cube([20, 5, 5], center=true);
	}
}


render() handle();

render() translate([0, 0, handle_height/2-2+.25]) puck("8");



