/*




*/
int side = 10;

int thisBit = 0;

String inputString = " ";
char currentChar = inputString.charAt(0);
int x;
int n = 16;
int padIntArray[] = new int[n];
String plainText = "TOO MANY SECRETS";  //16 charactrs
int plainTextIntArray[] = new int[n];
int cipherTextIntArray[] = new int[n];

void setup(){
   size(200,1000);   
   for(int index = 0;index < n;index++){
      plainTextIntArray[index] = int(plainText.charAt(index));
   }
   
}

void draw(){
  background(255);
  
  String padArray[] = loadStrings("pi.txt");
  String pad = padArray[0];

  for(int padIndex = 0;padIndex < n;padIndex++){
     x = 0;
     for(int bitIndex = 0;bitIndex < 7;bitIndex++){
        x += (int(pad.charAt(padIndex*7 + bitIndex)) - 48) << bitIndex;
     }
     padIntArray[padIndex] = x;
     //draw character
     text("plaintext  pad      ciphertext",side,side);
     writeChar(plainTextIntArray[padIndex],5*side,5*side + 4*side*padIndex);
     writeChar(x,10*side,5*side + 4*side*padIndex);
     writeChar(x | plainTextIntArray[padIndex],15*side,5*side + 4*side*padIndex);
}
  noLoop();
}



void writeChar(int myIntLocal,int xLocal,int yLocal){
  for(int digitIndex = 0;digitIndex < 7;digitIndex++){
    thisBit = (myIntLocal>>digitIndex)&1;
    if(thisBit ==1){
      fill(0);
    }
    else{
      noFill();
    }
    rect(xLocal - side*(digitIndex%3),yLocal - side*(digitIndex/3),side,side);
  }  
  fill(0);
  rect(xLocal - 3*side,yLocal - 3*side,side,side);
  noFill();  
}