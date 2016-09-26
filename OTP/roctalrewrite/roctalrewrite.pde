float x,y;
float side = 20;
float delta = 0;
char myChar = 'A';
int myInt = int(myChar);
int thisBit = 0;
float[] myColors = {137,133,135,0,0,0}; //white =0 , black =1
float[] colorDistanceArray = {0,0};

int A,B,C;

void setup(){
 size(290,392); 
 rectMode(CENTER);
}

void draw(){
  background(255);
  PImage myImage = loadImage("textpad2.png");
  image(myImage, 0, 0,width,height);
  
  drawCursor();
  //println(char(readChar(mouseX,mouseY)));
//  println((readChar(mouseX,mouseY)));
  A = readChar(mouseX - 5*int(side) - int(delta),mouseY);
  B = readChar(mouseX,mouseY);
  println(char(A));
  //print(B);
  //println(C);
  C = A^B;
  writeChar(C,mouseX,mouseY + 4*int(side));
//  println(binary(C,9));
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
  stroke(0);
  for(int digitIndex = 0;digitIndex < 9;digitIndex++){
    rect(x - side*(digitIndex%3),y - side*(digitIndex/3),side,side);
  }
  fill(0);
  rect(x - 3*side,y - 3*side,side,side);
  noFill();
  x -= 5*side + delta;  
    stroke(0);
  for(int digitIndex = 0;digitIndex < 9;digitIndex++){
    rect(x - side*(digitIndex%3),y - side*(digitIndex/3),side,side);
  }
  fill(0);
  rect(x - 3*side,y - 3*side,side,side);
  noFill();  

}


void writeChar(int myIntLocal,int xLocal,int yLocal){//go from an int to a  printed roctal character
  for(int digitIndex = 0;digitIndex < 9;digitIndex++){
    thisBit = (myIntLocal>>digitIndex)&1;  //this is where the action is, right shift then bitwise and 1 to grab a bit
    if(thisBit ==1){
      fill(0);//if the bit is 1, fill in black
    }
    else{
     // noFill();//if bit is zero(it had better be either 1 or 0 this is binary) leave white
       fill(255);
   }
    rect(xLocal - side*(digitIndex%3),yLocal - side*(digitIndex/3),side,side);
  }  
  fill(0);
  rect(xLocal - 3*side,yLocal - 3*side,side,side);
  noFill();  
  rect(xLocal - 1.5*side,yLocal - 1.5*side,4*side,4*side);
  rect(xLocal - 1*side,yLocal - 1*side,3*side,3*side);
}

void keyPressed(){
 myChar = key;
 if(key == 'u'){
    side *= 1.05; 
 }
  if(key == 'd'){
    side /= 1.05; 
 }
 if(key == 'q'){
  delta +=1; 
 }
  if(key == 'w'){
  delta -=1; 
 }

}