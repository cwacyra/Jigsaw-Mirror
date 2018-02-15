import processing.video.*;      

Capture camera;      // instance of the Capture class, used 
                     // to get frames from the camera

int x;
int x1;
int y;
int y1;
int b;
int c;
float a;

boolean moveside = true;
boolean moveup = false;
boolean moveside2 = false;
boolean moveup2 = false;
boolean rotate = false;
void setup() {
  size(1280, 720);
  
  x=0;
  x1=640;
  y= 0;
  y1 = 360;
  a = 0;
  b = 0;
  c = 0;
  
  
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("Couldn't detect any cameras!");
    exit();
  } 
  else {
    println("Available cameras:");
    printArray(cameras);
  }
  camera = new Capture(this, cameras[0]);
  camera.start();
}

void draw() {
  
  // only draw if there's a new frame available from the
  // camera (saves unecessary processing)
  if (camera.available()) {
    background(0);
    camera.read();
    int iStart = new Float(camera.width/2).intValue();
    int iWidth = camera.width-iStart;
   
    copy(camera, 0,0,640,360 ,x,y,640,360);   //top left
    copy(camera, 640,0,640,360,x1,y,640,360); //top right
    copy(camera, 0,360,640,360,x,y1,640,360);//bottom left
    copy(camera, 640,360,640,360,x1,y1,640,360);//bottom right
    
if(moveside){
    if(x<640){
    x+=5;
    }
    if(x1>0){
    x1-=5;
    }
    if(x==640){
    moveup = true;
    moveside = false;
    }
}
if(moveup){
    if(y<360){
    y+=5;
    }
    if(y1>0){
    y1-=5;
    }
    if(y==360){
      moveside2 = true;
      moveup=false;
    }
   }
if(moveside2){
    if(x>0){
    x-=5;
    }
    if(x1<640){
    x1+=5;
    }
    if(x==0){
      moveside2 = false;
      moveup2 = true;
   } 
  }
  
if(moveup2){
  if(y>0){
    y-=5;
 }
 if(y1<360){
   y1+=5;
 }
 if(y==0){
   moveup2=false;
   moveside=true;
   }
  }
 }
}

    
   