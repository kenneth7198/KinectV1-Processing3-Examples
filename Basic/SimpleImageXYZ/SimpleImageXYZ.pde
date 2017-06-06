import org.openkinect.processing.*;

Kinect kinect;
PImage img;

void setup(){
  size(640,480, P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw(){
  background(0);
  img = kinect.getDepthImage();
  image(img,0,0);
  //draw pixels
  for(int x = 0; x<img.width; x+=10){
    for(int y = 0; y<img.height; y+=10){
      int index = x + y * img.width;
      float b = brightness(img.pixels[index]);
      float z = b;
      fill(179,71,237);
      pushMatrix();
      translate(x,y,z);
      rect(0,0,10,10);
      popMatrix();
    }
  }
}