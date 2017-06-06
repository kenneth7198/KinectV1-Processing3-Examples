import org.openkinect.processing.*;

Kinect kinect;
PImage img;
PImage dImg;
int[] depth;
float minThreshold = 10;
float maxThreshold = 600;
int rec = 4500;
int rx = 0;
int ry = 0;
int index=0;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  kinect.initDepth();
  img = createImage(kinect.width, kinect.height, RGB);
}

void draw(){
  background(0);
  img.loadPixels();
  dImg = kinect.getDepthImage();
  depth = kinect.getRawDepth();
  rec = 4500;rx = 0;ry = 0;  
  for(int x = 0; x< kinect.width; x++){
    for(int y = 0; y< kinect.height; y++){
      index = x + y * kinect.width;
      int d = depth[index];
      if (d > minThreshold && d < maxThreshold){
        img.pixels[index] = color(255,0,55);
        if(d < rec){
          rec = d;
          rx = x;
          ry = y;
          //println("Rec="+d+",rx="+x+",ry="+y);
        }
      }else{
        img.pixels[index] = dImg.pixels[index];
      }
    }
  }
  img.updatePixels();
  image(img, 0, 0);
  ellipse(rx, ry, 25, 25);
}