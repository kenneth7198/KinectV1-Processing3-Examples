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
}