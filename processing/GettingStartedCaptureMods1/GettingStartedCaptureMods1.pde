/**
 * Getting Started with Capture.
 * 
 * Reading and displaying an image from an attached Capture device. 
 */

float side = 40;
float sideX = 40;
float sideY = 40;

import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

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
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0, width, height);
  // The following does the same as the above image() line, but 
  // is faster when just drawing the image without any additional 
  // resizing, transformations, or tint.
  //set(0, 0, cam);
  
  rectMode(CENTER);
  noFill();
  stroke(0);
  strokeWeight(2);
  for(int yIndex = -4;yIndex < 4;yIndex ++){  
    for(int xIndex = -4;xIndex < 4;xIndex++){ 
      rect(width/2 + sideX*xIndex,height/2 + sideY*yIndex,sideX,sideY);
    }
  }
}

void keyPressed(){
  if(key == 'u'){
     sideX *= 1.05; 
     sideY *= 1.05; 
  }
  if(key == 'd'){
     sideX /= 1.05; 
     sideY /= 1.05; 
  }
  if(key == 'x'){
     sideX /= 1.05; 
  }
  if(key == 'X'){
     sideX *= 1.05; 
  }
  if(key == 'y'){
     sideY /= 1.05; 
  }
  if(key == 'Y'){
     sideY *= 1.05; 
  }
  
  
}