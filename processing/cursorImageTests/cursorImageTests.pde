
//extract octal digit from an image 
//by moving the pointer around on it
//img2txt is misleading, this just goes to digit, txt is
//next program

int side = 100;
int digitValue = 0;


int[] blackC = {30,30,30};
int[] brownC = {76,53,52};
int[] redC = {129,45,69};
int[] orangeC = {146,73,23};
int[] yellowC = {138,127,38};
int[] greenC = {50,115,67};
int[] blueC = {30,78,130};
int[] violetC = {66,40,100};


float[] digitDistanceArray = {0,0,0,0,0,0,0,0};//how far are we from each color?

void setup(){
  size(521,298);
}
void draw(){
  background(255);
  PImage myImage = loadImage("GIGO1.png");
  image(myImage, 0, 0,521,298);
  noFill();
  rect(mouseX,mouseY,20,20);

  
  PImage cursor = get(mouseX,mouseY,20,20);

  int cursorRed = 0;
  int cursorGreen = 0;
  int cursorBlue = 0;
  for(int index = 0;index < cursor.width*cursor.height;index ++){
    cursorRed += red(cursor.pixels[index]);
    cursorGreen += green(cursor.pixels[index]);
    cursorBlue += blue(cursor.pixels[index]);
  }
  cursorRed /= cursor.width*cursor.height;
  cursorGreen /= cursor.width*cursor.height;
  cursorBlue /= cursor.width*cursor.height;

  print("(R, G, B) = (");
  print(cursorRed);
  print(", ");
  print(cursorGreen);
  print(", ");  
  print(cursorBlue);
  println(")");

  digitDistanceArray[0] = dist(cursorRed,cursorGreen,cursorBlue,blackC[0],blackC[1],blackC[2]);
  digitDistanceArray[1] = dist(cursorRed,cursorGreen,cursorBlue,brownC[0],brownC[1],brownC[2]);
  digitDistanceArray[2] = dist(cursorRed,cursorGreen,cursorBlue,redC[0],redC[1],redC[2]);
  digitDistanceArray[3] = dist(cursorRed,cursorGreen,cursorBlue,orangeC[0],orangeC[1],orangeC[2]);
  digitDistanceArray[4] = dist(cursorRed,cursorGreen,cursorBlue,yellowC[0],yellowC[1],yellowC[2]);
  digitDistanceArray[5] = dist(cursorRed,cursorGreen,cursorBlue,greenC[0],greenC[1],greenC[2]);
  digitDistanceArray[6] = dist(cursorRed,cursorGreen,cursorBlue,blueC[0],blueC[1],blueC[2]);
  digitDistanceArray[7] = dist(cursorRed,cursorGreen,cursorBlue,violetC[0],violetC[1],violetC[2]);
  
  
  for(int index =0;index < 8;index++){
    if(digitDistanceArray[index] == min(digitDistanceArray)){
      println(index);
      digitValue = index;
    }  
  }
/*
  textSize(32);
  switch(digitValue){
    case 0:
      text("0, black",width - 500,100);
    case 1:
      text("1, brown",width - 500,100);
    case 2:
      text("2, red",width - 500,100);
    case 3:
      text("3, orange",width - 500,100);
    case 4:
      text("4, yellow",width - 500,100);
    case 5:
      text("5, green",width - 500,100);
    case 6:
      text("6, blue",width - 500,100);
    case 7:
      text("7, violet",width - 500,100);

  }*/

  image(cursor, 0, 0,50,50);
}