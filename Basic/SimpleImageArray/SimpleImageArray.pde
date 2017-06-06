import org.openkinect.processing.*;

Kinect kinect;
PImage img;

void setup(){
  size(640,480);
  kinect = new Kinect(this);
  kinect.initDepth();
}

void draw(){
  background(0);
  img = kinect.getDepthImage();
  image(img,0,0);
  //draw pixels
  for(int x = 0; x<img.width; x+=10){
    for(int y = 0; y<img.height; y +=10){
      int index = x + y * img.width;
      float b = brightness(img.pixels[index]);
      fill(b);
      ellipse(x,y,5,5);
    }
  }
}