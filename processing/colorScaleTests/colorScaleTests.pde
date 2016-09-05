float[] myColors = new float[24];

float[] currentTriangle = new float[6];

float side = 50;
float h;//side*sqrt(3)/2
float r;//h/3
float x,y;//position of triangle midpoint
float theta = PI;


void setup(){
 size(500,500);
 x = width/4;
 y = height/4;
 
}

void draw(){
  h = sqrt(3)*side/2;
  r = 2*h/3;
  background(255);
  stroke(0);
  fill(0,0,0);
  makeTriangle();
  text("0",x - 0.07*side,y + 0.6*h);
  x -= 1.5*side;
  y += h;
  x += side;
  fill(127,0,0);
  makeTriangle();
  text("1",x - 0.07*side,y + 0.6*h);
  x += side;
  fill(255,0,0);
  makeTriangle();
  text("2",x - 0.07*side,y + 0.6*h);

  y += h;
  x -= 2.5*side;
  x += side;
  fill(255,127,0);
  makeTriangle();
  text("3",x - 0.07*side,y + 0.6*h);
  x += side;
  fill(255,255,0);
  makeTriangle();
  text("4",x - 0.07*side,y + 0.6*h);

  x += side;
  fill(0,255,0);

  makeTriangle();
  text("5",x - 0.07*side,y + 0.6*h);

  y += h;
  x -= 1.5*side;
    fill(0,0,255);

  makeTriangle();
  text("6",x - 0.07*side,y + 0.6*h);

  x += side;
  fill(127,0,127);
  
  makeTriangle();
  text("7",x - 0.07*side,y + 0.6*h);

  fill(127,0,0);
  side /= 2;
  h = sqrt(3)*side/2;
  r = 2*h/3;
  x += 1.5*side;
  y += h/3;
  makeTriangle();
  x += side/2;
  y -= h/3;
  theta = 0;
  fill(0);
  makeTriangle();
  x += side/2;
  y += h/3;
  theta = PI;
  fill(127,0,0);
  makeTriangle();
  x += side;
  makeTriangle();
  x += side/2;
  y -= h/3;
  theta = 0;
  fill(0);
  makeTriangle();
  x += side/2;
  y += h/3;
  theta = PI;
  fill(255,0,0);
  makeTriangle();

  x += side;
  fill(127,0,0);
  makeTriangle();
  x += side/2;
  y -= h/3;
  theta = 0;
  fill(0);
  makeTriangle();
  x += side/2;
  y += h/3;
  theta = PI;
  fill(255,127,0);
  makeTriangle();
  x += side;
  fill(127,0,0);
  makeTriangle();
  x += side/2;
  y -= h/3;
  theta = 0;
  fill(0);
  makeTriangle();
  x += side/2;
  y += h/3;
  theta = PI;
  fill(255,255,0);
  makeTriangle();


  noLoop();
}

void makeTriangle(){
   for(int index = 0;index < 6; index += 2){
      currentTriangle[index] = x + r*cos(-2*PI/12 + theta + index*2*PI/3);
      currentTriangle[index + 1] = y + r*sin(-2*PI/12 + theta + index*2*PI/3);
   }
  triangle(currentTriangle[0],currentTriangle[1],currentTriangle[2],currentTriangle[3],currentTriangle[4],currentTriangle[5]);
}