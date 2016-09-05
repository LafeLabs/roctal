

//there are 8 colors and 8 triangles and 8 squares


float[] myColors = {0,0,0,125,0,0,255,0,0,255,127,0,255,255,0,0,255,0,0,0,255,127,0,127,255,255,255};
float[] colorDistanceArray = {0,1,2,3,4,5,6,7,8};


float side = 50;
float x,y;//position of square center

int offset = 0;

int cursorRed = 0;
int cursorGreen = 0;
int cursorBlue = 0;

int digit = 0;

int eights,sixtyfours,ones;

void setup(){
  size(895,267);  
}

void draw(){
  background(255);  
  noFill();
  rectMode(CENTER);
  PImage myImage = loadImage("sawtoothpng.png");
  image(myImage, 0, 0,width,height);
  x = mouseX + offset;
  y = mouseY;
  strokeWeight(3); 
  rect(x,y,side,side);
  strokeWeight(0.5);
  rect(x,y,side/2,side/2);
  PImage cursor = get(int(x),int(y),int(side/2),int(side/2));
  cursorRed = 0;
  cursorGreen = 0;
  cursorBlue = 0;
  for(int index2 = 0;index2 < cursor.width*cursor.height;index2 ++){
        cursorRed += red(cursor.pixels[index2]);
        cursorGreen += green(cursor.pixels[index2]);
        cursorBlue += blue(cursor.pixels[index2]);
  }
  cursorRed /= cursor.width*cursor.height;
  cursorGreen /= cursor.width*cursor.height;
  cursorBlue /= cursor.width*cursor.height;
  

  fill(cursorRed,cursorGreen,cursorBlue);
  rect(width - 2*side,height - 2*side,4*side,4*side);
  noFill();

  for(int index = 0;index < 9;index++){  
    colorDistanceArray[index] = dist(cursorRed,cursorGreen,cursorBlue,myColors[3*index],myColors[3*index + 1],myColors[3*index + 2]);    
  }
  for(int index = 0;index < 9;index++){
    if(colorDistanceArray[index] == min(colorDistanceArray)){
      digit = index;
    }
  }
// println(digit); 

}

void keyPressed(){
  x = mouseX + offset;
  y = mouseY;

 if(key == 'd'){
    side /= 1.05; 
 }
 if(key == 'u'){
    side *= 1.05; 
 }
 if(int(key) >= 48 && int(key) <= 56){
  myColors[3*(int(key) - 48)] = cursorRed;
  myColors[3*(int(key) - 48) +1] = cursorGreen;
  myColors[3*(int(key) - 48) +2] = cursorBlue;
 }
 if(key == 'q'){
  sixtyfours = digit; 
 }
  if(key == 'w'){
  eights = digit; 
 }
  if(key == 'e'){
  ones = digit;
  print(char(ones + 8*eights + 64*sixtyfours));
 }
 if(key == 'm'){
  offset += side; 
 }
 if(key == 'n'){
  offset -= side; 
 }

}