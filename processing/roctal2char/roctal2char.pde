int[] roctalArray = {1,0,1};  // 101 octal is "A" in ASCII
char a;
int x;


void setup(){

}

void draw(){
  x = roctalArray[0]*64 + roctalArray[1]*8 + roctalArray[2];  
  a = char(x); 
  println(a);
}