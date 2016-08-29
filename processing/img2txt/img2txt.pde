//extract octal digit from an image 
//by moving the pointer around on it
//img2txt is misleading, this just goes to digit, txt is
//next program

int side = 100;
int digitValue = 0;

int ballSize = 2500;

int blackness,brownness,redness,orangeness,yellowness,greenness,blueness,violetness;
int whiteness;

void setup(){
  size(1280,960);
}
void draw(){
  PImage myImage = loadImage("crayonscale.jpg");
  image(myImage, 0, 0,1280,960);
  noFill();
  rect(mouseX,mouseY,20,20);
  rect(mouseX + side,mouseY,20,20);
  rect(mouseX + 2*side,mouseY,20,20);

  
  PImage cursor = get(mouseX,mouseY,20,20);
  PImage cursor2 = get(mouseX + side,mouseY,20,20);
  PImage cursor3 = get(mouseX + 2*side,mouseY,20,20);

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
  
  image(cursor, 0, 0,50,50);
  image(cursor2, 60, 0,50,50);
  image(cursor3, 120, 0,50,50);
  
//  color c = get(mouseX, mouseY);
  color c = color(cursorRed,cursorGreen,cursorBlue);
  
  blackness = (int(red(c)) - 30)*(int(red(c)) - 30) + (int(green(c)) - 30)*(int(green(c)) - 30) + (int(blue(c)) - 30)*(int(blue(c)) - 30);
  if(blackness < ballSize){
    blackness = 1;
    digitValue = 0;
  }
  else{
    blackness = 0;
  }
  
  brownness = (int(red(c)) - 75)*(int(red(c)) - 75) + (int(green(c)) - 30)*(int(green(c)) - 30) + (int(blue(c)) - 30)*(int(blue(c)) - 30);
  if(brownness < ballSize){
    brownness = 1;
    digitValue = 1;
  }
  else{
    brownness = 0;
  }

  redness = (int(red(c)) - 127)*(int(red(c)) - 127) + (int(green(c)) - 30)*(int(green(c)) - 30) + (int(blue(c)) - 30)*(int(blue(c)) - 30);
  if(redness < ballSize){
    redness = 1;
    digitValue = 2;
  }
  else{
    redness = 0;
  }

  orangeness = (int(red(c)) - 150)*(int(red(c)) - 150) + (int(green(c)) - 50)*(int(green(c)) - 50) + int(blue(c))*int(blue(c));
  if(orangeness < ballSize){
    orangeness = 1;
    digitValue = 3;
  }
  else{
    orangeness = 0;
  }

  yellowness = (int(red(c)) - 140)*(int(red(c)) - 140) + (int(green(c)) - 131)*(int(green(c)) - 131) + (int(blue(c)) - 40)*(int(blue(c)) - 40);
  if(yellowness < ballSize){
    yellowness = 1;
    digitValue = 4;
  }
  else{
    yellowness = 0;
  }

  greenness = (int(red(c)) - 54)*(int(red(c)) - 54) + (int(green(c)) - 120)*(int(green(c)) - 120) + (int(blue(c)) - 60)*(int(blue(c)) - 60);
  if(greenness < ballSize){
    greenness = 1;
    digitValue = 5;
  }
  else{
    greenness = 0;
  }

  blueness = (int(red(c)) - 30)*(int(red(c)) - 30) + (int(green(c)) -80)*(int(green(c)) - 80) + (int(blue(c)) - 130)*(int(blue(c)) - 130);
  if(blueness < ballSize){
    blueness = 1;
    digitValue = 6;
  }
  else{
    blueness = 0;
  }

  violetness = (int(red(c)) - 70)*(int(red(c)) - 70) + (int(green(c)) - 45)*(int(green(c)) - 45) + (int(blue(c)) - 127)*(int(blue(c)) - 127);
  if(violetness < ballSize){
    violetness = 1;
    digitValue = 7;
  }
  else{
    violetness = 0;
  }

  whiteness = (int(red(c)) - 130)*(int(red(c)) - 130) + (int(green(c)) - 133)*(int(green(c)) - 133) + (int(blue(c)) - 135)*(int(blue(c)) - 135);
  if(whiteness < ballSize){
    whiteness = 1;
    digitValue = -1;
  }
  else{
    whiteness = 0;
  }


 println(digitValue);

}