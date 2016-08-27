//extract octal digit from an image 
//by moving the pointer around on it
//img2txt is misleading, this just goes to digit, txt is
//next program

int side = 30;
int digitValue = 0;

int blackness,brownness,redness,orangeness,yellowness,greenness,blueness,violetness;
int whiteness;

void setup(){
  size(900,200);
}
void draw(){
  PImage myImage = loadImage("snowcrash2.png");
  image(myImage, 0, 0,900,200);
  
  color c = get(mouseX, mouseY);
  
  blackness = int(red(c))*int(red(c)) + int(green(c))*int(green(c)) + int(blue(c))*int(blue(c));
  if(blackness < 2500){
    blackness = 1;
    digitValue = 0;
  }
  else{
    blackness = 0;
  }
  
  brownness = (int(red(c)) - 127)*(int(red(c)) - 127) + int(green(c))*int(green(c)) + int(blue(c))*int(blue(c));
  if(brownness < 2500){
    brownness = 1;
    digitValue = 1;
  }
  else{
    brownness = 0;
  }

  redness = (int(red(c)) - 255)*(int(red(c)) - 255) + int(green(c))*int(green(c)) + int(blue(c))*int(blue(c));
  if(redness < 2500){
    redness = 1;
    digitValue = 2;
  }
  else{
    redness = 0;
  }

  orangeness = (int(red(c)) - 255)*(int(red(c)) - 255) + (int(green(c)) - 127)*(int(green(c)) - 127) + int(blue(c))*int(blue(c));
  if(orangeness < 2500){
    orangeness = 1;
    digitValue = 3;
  }
  else{
    orangeness = 0;
  }

  yellowness = (int(red(c)) - 255)*(int(red(c)) - 255) + (int(green(c)) - 255)*(int(green(c)) - 255) + int(blue(c))*int(blue(c));
  if(yellowness < 2500){
    yellowness = 1;
    digitValue = 4;
  }
  else{
    yellowness = 0;
  }

  greenness = (int(red(c)) - 0)*(int(red(c)) - 0) + (int(green(c)) - 127)*(int(green(c)) - 127) + int(blue(c))*int(blue(c));
  if(greenness < 2500){
    greenness = 1;
    digitValue = 5;
  }
  else{
    greenness = 0;
  }

  blueness = (int(red(c)) - 0)*(int(red(c)) - 0) + (int(green(c)) - 0)*(int(green(c)) - 0) + (int(blue(c)) - 255)*(int(blue(c)) - 255);
  if(blueness < 2500){
    blueness = 1;
    digitValue = 6;
  }
  else{
    blueness = 0;
  }

  violetness = (int(red(c)) - 127)*(int(red(c)) - 127) + (int(green(c)) - 0)*(int(green(c)) - 0) + (int(blue(c)) - 127)*(int(blue(c)) - 127);
  if(violetness < 2500){
    violetness = 1;
    digitValue = 7;
  }
  else{
    violetness = 0;
  }

  whiteness = (int(red(c)) - 255)*(int(red(c)) - 255) + (int(green(c)) - 255)*(int(green(c)) - 255) + (int(blue(c)) - 255)*(int(blue(c)) - 255);
  if(whiteness < 2500){
    whiteness = 1;
    digitValue = -1;
  }
  else{
    whiteness = 0;
  }


println(digitValue);

}