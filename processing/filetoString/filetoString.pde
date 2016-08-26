
String inputString = " ";

char currentChar = inputString.charAt(0);
int x = 0; //this has no meaning it is just x
int xPosition = 0;
int yPosition = 0;

int side = 2;

int sixtyfours  =0;
int eights = 0;
int ones = 0;
int[] roctalArray = new int[3];

color colorZero = color(0, 0, 0);//black
color colorOne = color(127, 0, 0);//brown
color colorTwo = color(255, 0, 0);//red
color colorThree = color(255, 127, 0);//orange
color colorFour = color(255, 255, 0);//yellow
color colorFive = color(0,127,0);//green
color colorSix = color(0,0,255);//blue
color colorSeven = color(127,0,127);// violet
color colorCurrent = color(0,0,0);

color onesColor = color(0,0,0);
color eightsColor = color(0,0,0);
color sixtyfoursColor = color(0,0,0);

void setup(){
  size(600,1000);
  
}

void draw(){
  background(255);
  String lines[] = loadStrings("stringToRoctal1.txt");//copy this code into this text file
  
  for (int i = 0 ; i < lines.length; i++) {
    println(lines[i]);
    inputString = lines[i];
     
  
    for(int index = 0;index < inputString.length();index++){
      currentChar = inputString.charAt(index);
      x = int(currentChar);
      ones = x&7; // the three rightmost bits
      eights = (x&63) >> 3; //use AND to get next 3 bits, right shift
      sixtyfours = (x & 127) >> 6; //again, 3 bits over again
  
      getColor(sixtyfours);
      sixtyfoursColor = colorCurrent;
      getColor(eights);
      eightsColor = colorCurrent;
      getColor(ones);
      onesColor = colorCurrent;
  
      fill(sixtyfoursColor);
      stroke(sixtyfoursColor);
      rect(3*side*index,yPosition + 0,side,side);
      fill(eightsColor);
      stroke(eightsColor);
      rect(3*side*index + side,yPosition + 0,side,side);
      fill(onesColor);
      stroke(onesColor);
      rect(3*side*index + 2*side,yPosition + 0,side,side);
      //stroke(0);
      //fill(0);
     // rect(3*side*index + 3*side,yPosition + side,side/10,side);
   //   text(currentChar,yPosition + float(3*side*index) + 1.5*float(side),float(2*side));
    }
  noLoop();
  yPosition += 3*side;
  }
}

void getColor(int y){
  switch(y){
     case 0:
       colorCurrent = colorZero;
       break;
     case 1:
       colorCurrent = colorOne;
       break;
     case 2:
       colorCurrent = colorTwo;
       break;
     case 3:
       colorCurrent = colorThree;
       break;
     case 4:
       colorCurrent = colorFour;
       break;
     case 5:
       colorCurrent = colorFive;
       break;
     case 6:
       colorCurrent = colorSix;
       break;
     case 7:
       colorCurrent = colorSeven;
       break;
   }
}