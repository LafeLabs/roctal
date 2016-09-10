
float[] myColors = {0,0,0, 125,0,0, 255,0,0, 255,127,0, 255,255,0, 0,127,0, 0,0,255, 127,0,127, 255,255,255};
//                  black, brown, red,    orange,   yellow,   green,  blue, violet, white

float[] line1 = {0,0,0,0};  //2 points, x and y
float side = 50;
float r = 0;
float theta = 0;
float n = 0;
float cursorSize = 20;
float x,y;


void setup(){
  background(255);
  size(640,426);
}

void draw(){
 stroke(0);
 background(255);
 PImage myImage = loadImage("squarecrayon4.jpg");
 image(myImage, 0, 0,width,height);
 x= mouseX;
 y = mouseY;
 ellipse(x,y,10,10);
 noFill();
 line(line1[0],line1[1],line1[2],line1[3]);
     r = sqrt( (line1[2] - line1[0])*(line1[2] - line1[0]) + (line1[3] - line1[1])*(line1[3] - line1[1])); 
    n = r/side; //number of letters
    theta = atan((line1[3] - line1[1])/(line1[2] - line1[0]));
    for(int index = 0;index <= n; index++){
       rect(line1[0] + index*side*cos(theta),line1[1] + index*side*sin(theta),cursorSize,cursorSize); 
    }
}



void keyPressed(){
 if(key == 'a'){
    line1[0] = x;
    line1[1] = y;
 }
 if(key == 'b'){
    line1[2] = x;
    line1[3] = y;
 }
 if(key == 'u'){
    side *= 1.01;
 }
  if(key == 'd'){
    side /= 1.01;
 }
}