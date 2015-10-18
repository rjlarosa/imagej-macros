# imagej-macros
Macros to assist with output of trait measurements, making data easier to work with.

The main benefit to this macro is that the ouput contains the file name to avoid naming errors. You can name your photos with individual IDs and those IDs will be linked to the trait measurements in the output.

## Linear measurements
This macro allows you to measure up to 10 linear (or segmented) traits. Use the number keys to denote the traits. The output will give the file name, followed by the ten lengths. If you only meaure three traits, the other seven traits will show as -1. The negative ones can then be removed from the data once it is copied to a spreadsheet.

---

### Install instructions

This repo contains various macros that can be used in ImageJ v.1.45. If you want to use one of them, you will have to replace the StartupMacros.txt file that is in ImageJ>Macros folder with the file you choose. You will then need to rename the new file to StartupMacros.txt for ImageJ to recognize it. 

## StartupMacros.txt
The original file that comes with ImageJ in April 2012

## StartupMacros_123_5mm.txt
This allows you to set the scale at 5mm by hitting "x" after you draw the scale line. To measure traits, measure trait 1 and hit "1", then measure trait 2 and hit "2" and so on. If you hit a number twice, the second measurement will overwrite the first. To display the results, hit "-"   You can use either the numbers along the top of the keyboard or the number pad.

## StartupMacros_123_2mm.txt
Does the same as above, but sets the scale at 2mm instead of 5mm.
