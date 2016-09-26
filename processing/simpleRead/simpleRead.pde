/*
  Simple Roctal Character Read program.
  Sept. 2016
  www.lafelabs.org
  No copyright no license, no property 
  no patents no mining no money
  
  replace the filename with image of observed Roctal code
  replace the size with the size of that image
*/


float x,y;
float side = 20;
float delta = 0;
char myChar = 'A';
int myInt = int(myChar);
int thisBit = 0;
float[] myColors = {127,127,127,0,0,0}; //white =0 , black =1
float[] colorDistanceArray = {0,0};

int A;

void setup(){
 size(57,511); //replace with image size
 rectMode(CENTER);
}

void draw(){
  background(255);
  PImage myImage = loadImage("message3.png");//replace with your imag
  image(myImage, 0, 0,width,height); 
  drawCursor();
  A = readChar(mouseX,mouseY);
  if(A < 128){
    println(char(A));
  }
}

int readChar(int xLocal,int yLocal){
  float cursorRed = 0;
  float cursorGreen = 0;
  float cursorBlue = 0;

  int n;
  int localInt =0;
  for(int digitIndex = 0;digitIndex < 9;digitIndex++){
      PImage cursor = get(int(xLocal - side*(digitIndex%3)),int(yLocal - side*(digitIndex/3)),int(side/2),int(side/2));
      n = cursor.width*cursor.height;
      cursorRed = 0;
      cursorGreen = 0;
      cursorBlue = 0;
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
            thisBit = colorIndex;
            //print(thisBit);
        }
    }
    localInt = localInt + 512*thisBit;
    localInt = localInt >> 1;
  }
//  println();
  return localInt;

}

void drawCursor(){
  x = mouseX;
  y = mouseY;
  noFill();
  stroke(255,0,0);
  for(int digitIndex = 0;digitIndex < 9;digitIndex++){
    rect(mouseX - side*(digitIndex%3),mouseY - side*(digitIndex/3),side,side);
  }
  fill(0);
  rect(mouseX - 3*side,mouseY - 3*side,side,side);
  text(char(A),mouseX - 2.2*side,mouseY - 2.8*side);
  noFill();
}


void keyPressed(){
 myChar = key;
 if(key == 'u'){
    side *= 1.05; 
 }
  if(key == 'd'){
    side /= 1.05; 
 }
}