This macro currently does not function. The idea was that one could use the segmented line tool to draw an angle and then get the lengths of the two legs, as well as the angle of them.

macro "AngleItUp [A]" {
  seltype = selectionType();
  if(seltype == 6 || seltype == 8) {
    getSelectionCoordinates(x, y);
    getVoxelSize(w, h, d, unit);

    /* Determine length 1 */
    dx1 = (x[0] - x[1]) * w;
    dy1 = (y[0] - y[1]) * w;
    length1 = sqrt((dx1 * dx1) + (dy1 * dy1));

    /* Determine length 2 */
    dx2 = (x[1] - x[2]) * w;
    dy2 = (y[1] - y[2]) * w;
    length2 = sqrt((dx2 * dx2) + (dy2 * dy2));

	/* Determine length 3 */
	dx3 = (x[0] - x[2]) * w;
    dy3 = (y[0] - y[2]) * w;
    length3 = sqrt((dx3 * dx3) + (dy3 * dy3));

    /* Determine angle between the two lines */
	angle = acos(((length1 * length1) + (length2 * length2) - (length3 * length3)) / (2 * length1 * length2));
	    
    /* Radians to degrees */
    angle_degrees = angle * (180 / PI);
    
    print(length1 + "\t" +
          length2 + "\t" +
          angle_degrees);
  }
  else {
    showMessage("BORK", "Select a segmented line or angle, kthxbai");
  }
}
