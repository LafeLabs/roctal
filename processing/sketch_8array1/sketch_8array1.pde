

//there are 8 colors and 8 triangles and 8 squares


float[] myColors = {0,0,0,125,0,0,255,0,0,255,127,0,255,255,0,0,255,0,0,0,255,127,0,127};
float[] colorDistanceArray = {0,0,0,0,0,0,0,0};
float cursorRed = 0;
float cursorGreen = 0;
float cursorBlue = 0;
int n = 0;//number of pixels
int ones,eights,sixtyfours;

float side = 42;

float x,y;



void setup(){
  size(540,540);
  rectMode(CENTER);
  noFill();
  stroke(0);
  strokeWeight(2);
}

void draw(){
  background(255);  
  PImage myImage = loadImage("roctal-ipad.jpg");
  image(myImage, 0, 0,width,height);
  x = mouseX;
  y = mouseY;
 
  for(int indexY = -4;indexY < 4;indexY++){
    for(int indexX = -4;indexX <4;indexX++){
      rect(x + indexX*side,y + indexY*side,side,side);
      rect(x + indexX*side,y + indexY*side,side/2,side/2);

    }
  }
  for(int indexX = 0;indexX < 8;indexX++){
      fill(color(myColors[3*indexX],myColors[3*indexX + 1],myColors[3*indexX + 2]));
      rect(2*side + indexX*side,2*side,side/2,side/2);
    }
  noFill();

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
    for(int colorIndex = 0;colorIndex < 8;colorIndex++){
        colorDistanceArray[colorIndex] = dist(cursorRed,cursorGreen,cursorBlue,myColors[3*colorIndex],myColors[3*colorIndex+1],myColors[3*colorIndex+2]);
    }
    for(int colorIndex = 0;colorIndex < 8;colorIndex++){
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
      int indexY = -4;
      for(int indexX = -4;indexX < 4;indexX++){
        cursorRed = 0;
        cursorGreen = 0;
        cursorBlue = 0;

        PImage cursor = get(int(x + indexX*side),int(y + indexY*side),int(side/2),int(side/2));
        n = cursor.width*cursor.height;
        for(int cursorIndex = 0;cursorIndex < n;cursorIndex ++){
           cursorRed += red(cursor.pixels[cursorIndex]);
           cursorGreen += green(cursor.pixels[cursorIndex]);
           cursorBlue += blue(cursor.pixels[cursorIndex]);
         }
        cursorRed /= n;
        cursorGreen /= n;
        cursorBlue /= n;
        myColors[3*(indexX + 4)] = cursorRed;
        myColors[3*(indexX + 4) + 1] = cursorGreen;
        myColors[3*(indexX + 4) + 2] = cursorBlue;
     }
   }
   if(key == 'b'){
      print(getDigit(x-side,y));
      print(getDigit(x,y));
      print(getDigit(x+side,y));
      print(" ");
      println(char(getDigit(x-side,y)*64 + getDigit(x,y)*8 + getDigit(x+side,y)));
   }

}