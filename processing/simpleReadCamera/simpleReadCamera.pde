/*
  Simple Roctal Character Read program. With camera.
  Sept. 2016
  www.lafelabs.org
  No copyright no license, no property 
  no patents no mining no money
  
  replace the filename with image of observed Roctal code
  replace the size with the size of that image
*/

import processing.video.*;

Capture cam;


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
 size(640, 480); //replace with image size
 String[] cameras = Capture.list();
 
   if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    printArray(cameras);

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam.start();
  } 
 rectMode(CENTER);
}

void draw(){
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, width, height);

//  background(255);
//  PImage myImage = loadImage("message3.png");//replace with your imag
 // image(myImage, 0, 0,width,height); 
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