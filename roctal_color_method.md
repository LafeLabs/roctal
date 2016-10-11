# Roctal Color Method (RCM) \m/

The Rocktal Color Method is a software-independent system for turning ASCII files into colors and vice versa.  This can be done with screens and cameras, printers, marker based chart recorders, chemicals of various kinds, by hand, etc etc.  It can scale down to below the wavelength of light using near field optical antennas, and can scale up to gallons of colored fluid or more.  I do not ever assume that data will be separate from physical things.  So a single roctal digit might be of various sizes and materials and functionalities, depending on that piece of information's role in the overall system. 

ASCII characters can all be represented by 8 bit bytes(usually 7 bits are enough, but 8 covers extended character sets).  In roctal we use 3 digit base 8 numbers, which is equivalent to 9 bits, so not all possible roctal numbers correspond to proper 8 bit bytes, and those numbers should raise an error.  Each digit is represented by a color, and those colors are taken from the first 8 of the resistor color code.  

The base 10 resistor color code is as follows:

| digit | color |
| ------------ | ------------- |
| 0 | black  |
| 1 | brown  |
| 2 | red |
| 3 | orange |
| 4 | yellow|
| 5 | green|
| 6 | blue|
| 7 | violet|
| 8 | grey |
| 9 | white|

In roctal, I remove both white and grey because I think they're going to cause trouble and because that gets us the 0-7 we need for a base 8 system.  Also, I choose the colors to be RGB values that are all either 0, 127 or 255(I did not go to art school and don't care about no darn rules, I make it up as I go).  The colors in roctal are thus:

| digit | color | (R,G,B) | HEX value
| ------------ |------------- |  ----- | ---|
| 0 | black  |  (0,0,0) | #000000
| 1 | brown  | (127,0,0) | #7F0000
| 2 | red |		(255,0,0)| #FF0000
| 3 | orange | (255,127,0)|#FF7F00
| 4 | yellow|  (255,255,0)|#FFFF00 
| 5 | green|   (0,127,0) | #007F00
| 6 | blue|    (0,0,255) | #0000FF
| 7 | violet|   (127,0,127)| #7F007F

sets of three color units(stripe, triangle, hexagon, circle, etc) make up one character which is an 8 bit byte.  

So to translate from roctal to ASCII we need to take sets of 3 color units, turn them into a three digit base 8 number, then record that in binary as an 8 bit byte in the ASCII range.  Incoming color signals can be tested for being within some reasonable distance in (R,G,B) space, and make an error if they're outside of some radius of all the possible roctal colors. 

To translate from ASCII to roctal, sets of three bits can be turned into base 8 digits, which are then turned into the proper color, and imprinted in the medium in question.  

That's it.  The map from a sequence of colored objects to ASCII and back as defined above is all there is to the basic roctal standard.  

The most basic application of this I want to create first is a self replicating physical object that has code imprinted in it to duplicate itself using a human/computer/machine combination.  Code that makes code.  At first with computers but later with other machines.  So this standard is at the core of the plan to build self replicating physical objects. 

Also, print with trash, slice up magazines, sort colors, deposit data in trash glued to a surface.  This can be trash of any kind.




## INTELLECTUAL PROPERTY NOTICE



ALL WORK CREATED HERE IS THE PRODUCT OF A PERSON OR PEOPLE WHO DO NOT RECOGNIZE THE VALIDITY OF ANY INTELLECTUAL PROPERTY OR INDEED ANY OTHER PROPERTY LAW.  NO RESTRICTIONS BASED ON SUCH LAW ARE HERE DECLARED OR RECOGNIZED.  ALL USE BY ANYONE WITHOUT ANY RESTRICTION INCLUDING FOR COMMERCIAL PURPOSES IS ALLOWED, SINCE NO LAW IS REFERENCED AT ALL IN THIS DOCUMENT.  THIS IS A SELF-ANNULLING DOCUMENT, IN THAT IT IS INTENDED TO CARRY NO LEGAL WEIGHT AND TO SERVE AS A SUBSTITUTE FOR A LEGAL DECLARATION AND A NEGATION OF ANY POTENTIAL LEGAL CLAIMS.  NO LIABILITY BASED ON CREATIONS HEREIN ARE RECOGNIZED BY THE AUTHOR. NO LAW OF ANY KIND IS RECOGNIZED BY THE AUTHOR.

NO PATENTS

NO COPYRIGHTS

NO LAWS

NO MONEY

NO MINING