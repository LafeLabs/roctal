
int[] roctalColors = new int[24];
color colorZero = color(0, 0, 0);//black
color colorOne = color(127, 0, 0);//brown
color colorTwo = color(255, 0, 0);//red
color colorThree = color(255, 127, 0);//orange
color colorFour = color(255, 255, 0);//yellow
color colorFive = color(0,127,0);//green
color colorSix = color(0,0,255);//blue
color colorSeven = color(127,0,127);// violet
color colorCurrent = color(0,0,0);

int ones, eights, sixtyfours;

float x = width/2;
float y = height/2;

int row = 0;
int column = 0;

float side = 35;
float h = sqrt(3)*side/2;
float trianglePoints[] = new float[6];
float r = h/3;
float theta = PI/2;

char myChar = ' ';

void setup(){
  size(600,600);
  background(255);
}

void draw(){
   //background(255);
   theta = PI/2;
   x = side*column + 30;
   y = h*row + 30;
   drawChar(myChar);
}


void drawChar(char charTemp){
    ones = int(charTemp)&7; // the three rightmost bits
    eights = (int(charTemp)&63) >> 3; //use AND to get next 3 bits, right shift
    sixtyfours = (int(charTemp) & 127) >> 6; //again, 3 bits over again

   for(int index = 0;index < 6; index += 2){
      trianglePoints[index] = x + r*cos(theta + index*2*PI/3);
      trianglePoints[index + 1] = y + r*sin(theta + index*2*PI/3);
   }
   setColor(eights);
   triangle(trianglePoints[0],trianglePoints[1],trianglePoints[2],trianglePoints[3],trianglePoints[4],trianglePoints[5]);
   x -= 0.25*side;
   y += h/6;
   theta += PI;
   for(int index = 0;index < 6; index += 2){
      trianglePoints[index] = x + r*cos(theta + index*2*PI/3);
      trianglePoints[index + 1] = y + r*sin(theta + index*2*PI/3);
   }
   setColor(sixtyfours);
   triangle(trianglePoints[0],trianglePoints[1],trianglePoints[2],trianglePoints[3],trianglePoints[4],trianglePoints[5]);
   
   x += 0.5*side;
 
   for(int index = 0;index < 6; index += 2){
      trianglePoints[index] = x + r*cos(theta + index*2*PI/3);
      trianglePoints[index + 1] = y + r*sin(theta + index*2*PI/3);
   }
   setColor(ones);
   triangle(trianglePoints[0],trianglePoints[1],trianglePoints[2],trianglePoints[3],trianglePoints[4],trianglePoints[5]);

   x -= 0.25*side;
   y -= 0.5*h;
   for(int index = 0;index < 6; index += 2){
      trianglePoints[index] = x + r*cos(theta + index*2*PI/3);
      trianglePoints[index + 1] = y + r*sin(theta + index*2*PI/3);
   }

   stroke(0);
}

void setColor(int digitLocal){
    switch(digitLocal){
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
  fill(colorCurrent);
  stroke(colorCurrent);   
}

void keyPressed(){
  myChar = key;
  println(key);
  column += 1;
  if(x > width - 80){
   column = 0;
   row += 1;
  }
}