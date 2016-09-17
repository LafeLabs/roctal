

float[] myColors = {137,133,135,0,0,0}; //white =0 , black =1
float[] colorDistanceArray = {0,0};
float cursorRed = 0;
float cursorGreen = 0;
float cursorBlue = 0;
int n = 0;//number of pixels
int ones,eights,sixtyfours;

float side = 28;

float x,y;

void setup(){
  size(621,518);
  rectMode(CENTER);
  noFill();
  stroke(0);
  strokeWeight(1);
}

void draw(){
  background(255);  
  PImage myImage = loadImage("BWroctal1zoom.png");
  image(myImage, 0, 0,width,height);
  x = mouseX;
  y = mouseY;
 
  for(int indexY = -1;indexY < 2;indexY++){
    for(int indexX = -1;indexX < 2;indexX++){
      rect(x + indexX*side,y + indexY*side,side,side);
      rect(x + indexX*side,y + indexY*side,side/2,side/2);
    }
  }
  noFill();
  sixtyfours = 4*getDigit(x - side,y - side);
  sixtyfours += 2*getDigit(x,y - side);
  sixtyfours += getDigit(x + side,y - side);
  eights = 4*getDigit(x - side,y);
  eights += 2*getDigit(x,y);
  eights += getDigit(x + side,y);
  ones = 4*getDigit(x - side,y + side);
  ones += 2*getDigit(x,y + side);
  ones += getDigit(x + side,y + side); 
  println(char(ones + 8*eights + 64*sixtyfours));
}

int getDigit(float xLocal,float yLocal){
    int digit = 0;
    cursorRed = 0;
    cursorGreen = 0;
    cursorBlue = 0;

    PImage cursor = get(int(xLocal),int(yLocal),int(side/2),int(side/2));
    n = cursor.width*cursor.height;
    for(int cursorIndex = 0;cursorIndex < n;cursorIndex ++){
       cursorRed += red(cursor.pixels[cursorIndex]);
       cursorGreen += green(cursor.pixels[cursorIndex]);
       cursorBlue += blue(cursor.pixels[cursorIndex]);
     }
    cursorRed /= n;
    cursorGreen /= n;
    cursorBlue /= n;
    for(int colorIndex = 0;colorIndex < 2;colorIndex++){
        colorDistanceArray[colorIndex] = dist(cursorRed,cursorGreen,cursorBlue,myColors[3*colorIndex],myColors[3*colorIndex+1],myColors[3*colorIndex+2]);
    }
    for(int colorIndex = 0;colorIndex < 2;colorIndex++){
        if(colorDistanceArray[colorIndex] == min(colorDistanceArray)) {
            digit = colorIndex;
        }
    }
    return digit;
}


void keyPressed(){
   if(key == 'u'){
     side *= 1.01;
   }
   if(key == 'd'){
     side /= 1.01;
   }
   if(key == 'a'){
      cursorRed = 0;
      cursorGreen = 0;
      cursorBlue = 0;

      PImage cursor = get(int(x - side),int(y - side),int(side/2),int(side/2));
      n = cursor.width*cursor.height;
      for(int cursorIndex = 0;cursorIndex < n;cursorIndex ++){
         cursorRed += red(cursor.pixels[cursorIndex]);
         cursorGreen += green(cursor.pixels[cursorIndex]);
         cursorBlue += blue(cursor.pixels[cursorIndex]);
       }
      cursorRed /= n;
      cursorGreen /= n;
      cursorBlue /= n;
      myColors[0] = cursorRed;
      myColors[1] = cursorGreen;
      myColors[2] = cursorBlue;
      print("white, 0 = ",cursorRed,"  ",cursorGreen,"  ",cursorBlue);
      
      cursorRed = 0;
      cursorGreen = 0;
      cursorBlue = 0;

      cursor = get(int(x - 2*side),int(y - 2*side),int(side/2),int(side/2));
      n = cursor.width*cursor.height;
      for(int cursorIndex = 0;cursorIndex < n;cursorIndex ++){
         cursorRed += red(cursor.pixels[cursorIndex]);
         cursorGreen += green(cursor.pixels[cursorIndex]);
         cursorBlue += blue(cursor.pixels[cursorIndex]);
       }
      cursorRed /= n;
      cursorGreen /= n;
      cursorBlue /= n;
      myColors[0] = cursorRed;
      myColors[1] = cursorGreen;
      myColors[2] = cursorBlue;
      print("black, 1 = ",cursorRed,"  ",cursorGreen,"  ",cursorBlue);
      
      
   }
}