/**
 * Custom ImageJ functions & macros
 *
 * $Id: imagej-macros.js 7 2009-10-27 00:47:20Z bgollmer $
 */
 
macro "-" {}

/* Global storage for lengths */
var length1  = -1;
var length2  = -1;
var length3  = -1;
var length4  = -1;
var length5  = -1;
var length6  = -1;
var length7  = -1;
var length8  = -1;
var length9  = -1;
var length10 = -1;

/**
 * Calculates the length of the current selection; works on both
 * straight lines and segmented lines
 */
function getLength(n)
{
  length = -1;
  getVoxelSize(w, h, d, unit);
  seltype = selectionType();
  
  /* Segmented line */
  if(seltype == 6)
  {
    getSelectionCoordinates(x, y);
    
    length = 0;
    for(i = 1; i < x.length; i++)
    {
      dx = (x[i] - x[i-1]) * w;
      dy = (y[i] - y[i-1]) * h;
      
      length += sqrt(dx*dx + dy*dy);
    }
  }
  
  /* Straight line */
  else if(seltype == 5)
  {
    getLine(x1, y1, x2, y2, pw);
    
    dx = (x2 - x1) * w;
    dy = (y2 - y1) * h;
    
    length = sqrt(dx*dx + dy*dy);
  }
  
  if(n > -1) showStatus("Length" + n + " = " + length + " " + unit);
  return length;
}

/**
 * Displays the results in tab-delimited format, then resets
 * the length storage vars
 */
function displayResults()
{
  print(getTitle() + "\t" +
        length1    + "\t" +
        length2    + "\t" +
        length3    + "\t" +
        length4    + "\t" +
        length5    + "\t" +
        length6    + "\t" +
        length7    + "\t" +
        length8    + "\t" +
        length9    + "\t" +
        length10);
  
  length1 = -1;
  length2 = -1;
  length3 = -1;
  length4 = -1;
  length5 = -1;
  length6 = -1;
  length7 = -1;
  length8 = -1;
  length9 = -1;
  length10 = -1;
}

/* Assign the current length to length[n] */
macro "Measure Length 1 [1]"   { length1  = getLength(1);  }
macro "Measure Length 1 [n1]"  { length1  = getLength(1);  }
macro "Measure Length 2 [2]"   { length2  = getLength(2);  }
macro "Measure Length 2 [n2]"  { length2  = getLength(2);  }
macro "Measure Length 3 [3]"   { length3  = getLength(3);  }
macro "Measure Length 3 [n3]"  { length3  = getLength(3);  }
macro "Measure Length 4 [4]"   { length4  = getLength(4);  }
macro "Measure Length 4 [n4]"  { length4  = getLength(4);  }
macro "Measure Length 5 [5]"   { length5  = getLength(5);  }
macro "Measure Length 5 [n5]"  { length5  = getLength(5);  }
macro "Measure Length 6 [6]"   { length6  = getLength(6);  }
macro "Measure Length 6 [n6]"  { length6  = getLength(6);  }
macro "Measure Length 7 [7]"   { length7  = getLength(7);  }
macro "Measure Length 7 [n7]"  { length7  = getLength(7);  }
macro "Measure Length 8 [8]"   { length8  = getLength(8);  }
macro "Measure Length 8 [n8]"  { length8  = getLength(8);  }
macro "Measure Length 9 [9]"   { length9  = getLength(9);  }
macro "Measure Length 9 [n9]"  { length9  = getLength(9);  }
macro "Measure Length 10 [0]"  { length10 = getLength(10); }
macro "Measure Length 10 [n0]" { length10 = getLength(10); }

/* Display the measured lengths */
macro "Display Results [P]"  { displayResults() };

/* Set the scale to 5mm */
macro "Set Scale [s]"
{
  /* Reset the scale first */
  run("Set Scale...", "distance=0 known=0 pixel=1 unit=pixel");
  
  length = getLength(-1);
  if(length == -1) exit("A line is required to set the scale.");
  
  run("Set Scale...", "distance=" + length + " known=5 pixel=1 unit=mm");
  showStatus("Set scale - " + length + " = 5 mm");
}
