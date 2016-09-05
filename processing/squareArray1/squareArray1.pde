

//there are 8 colors and 8 triangles and 8 squares


float[] myColors = {0,0,0,125,0,0,255,0,0,255,127,0,255,255,0,0,255,0,0,0,255,127,0,127};
int[] mnArray = {0,0,0,1,1,1,0,2,1,2,2,2,1,3,2,3};
float[] colorDistanceArray = {0,0,0,0,0,0,0,0};

int ones, eights, sixtyfours;

int n,m;
float[] currentTriangle = new float[6];

float side = 50;
float h;//side*sqrt(3)/2
float r;//h/3
float x,y;//position of triangle midpoint
float theta = PI;

  int cursorRed = 0;
  int cursorGreen = 0;
  int cursorBlue = 0;

int digit = 0;

void setup(){
  size(640,426);
  
}

void draw(){
  background(255);  
  PImage myImage = loadImage("squarecrayon2.jpg");
  image(myImage, 0, 0,width,height);

  for(int index = 0;index < 8;index++){
     stroke(myColors[3*index],myColors[3*index + 1],myColors[3*index + 2]);
     makeTriangle(mnArray[2*index],mnArray[2*index + 1]);
  }  
}

void makeTriangle(int n, int m){
  noFill();
  rectMode(CENTER);
  h = side;
  r = 2*h/3;
  x = mouseX;
  y = mouseY - 2*side;
  y += m*side;
  x -= m*0.5*side;
  x += n*side;

  rect(x,y,side,side);
  

}

void keyPressed(){
  if(key == 'a'){
    for(int index = 0;index < 8; index++){
      x = mouseX;
      y = mouseY - 2*h;
      m = mnArray[2*index +1];
      n = mnArray[2*index ];
      y += m*side;
      x -= m*0.5*side;
      x += n*side;
      cursorRed = 0;
      cursorGreen = 0;
      cursorBlue = 0;
      PImage cursor = get(int(x),int(y),int(side/2),int(side/2));
      for(int index2 = 0;index2 < cursor.width*cursor.height;index2 ++){
        cursorRed += red(cursor.pixels[index2]);
        cursorGreen += green(cursor.pixels[index2]);
        cursorBlue += blue(cursor.pixels[index2]);
      }
      cursorRed /= cursor.width*cursor.height;
      cursorGreen /= cursor.width*cursor.height;
      cursorBlue /= cursor.width*cursor.height;

      myColors[3*index] = cursorRed;
      myColors[3*index + 1] = cursorGreen;
      myColors[3*index + 2] = cursorBlue;
      
      fill(cursorRed,cursorGreen,cursorBlue);
      rect(side/4 + index*int(side/2),side/4,side/4,side/4);
      noFill();

    }
  }
  if(key == 'b'){
    background(255);
    PImage myImage = loadImage("squarecrayon2.jpg");
    image(myImage, 0, 0,width,height);
    x = mouseX;
    y = mouseY;

    PImage cursorEights = get(int(x),int(y),int(side/2),int(side/2));
    PImage cursorSixtyfours = get(int(x - side),int(y),int(side/2),int(side/ 2));
    PImage cursorOnes = get(int(x + side),int(y),int(side/2),int(side/2));


    for(int index2 = 0;index2 < cursorEights.width*cursorEights.height;index2++){
        cursorRed += red(cursorEights.pixels[index2]);
        cursorGreen += green(cursorEights.pixels[index2]);
        cursorBlue += blue(cursorEights.pixels[index2]);
     }
     cursorRed /= cursorEights.width*cursorEights.height;
     cursorGreen /= cursorEights.width*cursorEights.height;
     cursorBlue /= cursorEights.width*cursorEights.height;

     for(int index3 = 0;index3 < 8;index3++){
       colorDistanceArray[index3] = 0;
     }
     for(int index3 = 0;index3 < 8;index3++){
        colorDistanceArray[index3] += pow(myColors[3*index3] - cursorRed,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 1] - cursorGreen,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 2] - cursorBlue,2);
     }

    float minDistance =10000;
    for(int index3 = 0;index3 < 8;index3++){
     if(colorDistanceArray[index3] < minDistance){
       minDistance = colorDistanceArray[index3];
       digit = index3;
     }
  }
  eights = digit;

  
    for(int index2 = 0;index2 < cursorOnes.width*cursorOnes.height;index2++){
        cursorRed += red(cursorOnes.pixels[index2]);
        cursorGreen += green(cursorOnes.pixels[index2]);
        cursorBlue += blue(cursorOnes.pixels[index2]);
     }
     cursorRed /= cursorOnes.width*cursorOnes.height;
     cursorGreen /= cursorOnes.width*cursorOnes.height;
     cursorBlue /= cursorOnes.width*cursorOnes.height;

     for(int index3 = 0;index3 < 8;index3++){
       colorDistanceArray[index3] = 0;
     }
     for(int index3 = 0;index3 < 8;index3++){
        colorDistanceArray[index3] += pow(myColors[3*index3] - cursorRed,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 1] - cursorGreen,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 2] - cursorBlue,2);
     }

    minDistance =10000;
    for(int index3 = 0;index3 < 8;index3++){
     if(colorDistanceArray[index3] < minDistance){
       minDistance = colorDistanceArray[index3];
       digit = index3;
     }
  }
  ones = digit;


  
    for(int index2 = 0;index2 < cursorSixtyfours.width*cursorSixtyfours.height;index2++){
        cursorRed += red(cursorSixtyfours.pixels[index2]);
        cursorGreen += green(cursorSixtyfours.pixels[index2]);
        cursorBlue += blue(cursorSixtyfours.pixels[index2]);
     }
     cursorRed /= cursorSixtyfours.width*cursorSixtyfours.height;
     cursorGreen /= cursorSixtyfours.width*cursorSixtyfours.height;
     cursorBlue /= cursorSixtyfours.width*cursorSixtyfours.height;

     for(int index3 = 0;index3 < 8;index3++){
       colorDistanceArray[index3] = 0;
     }
     for(int index3 = 0;index3 < 8;index3++){
        colorDistanceArray[index3] += pow(myColors[3*index3] - cursorRed,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 1] - cursorGreen,2);
        colorDistanceArray[index3] += pow(myColors[3*index3 + 2] - cursorBlue,2);
     }

    minDistance =10000;
    for(int index3 = 0;index3 < 8;index3++){
     if(colorDistanceArray[index3] < minDistance){
       minDistance = colorDistanceArray[index3];
       digit = index3;
     }
  }
  sixtyfours = digit;
  println(char(64*sixtyfours + 8*eights + ones));
  }
  if(key == 'u'){
     side *= 1.05;
   }
   if(key == 'd'){
    side /= 1.05;
   }
}