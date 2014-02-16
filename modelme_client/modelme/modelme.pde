import SimpleOpenNI.*;
import processing.net.*;

import java.io.*;
import java.util.*;
import java.awt.image.*;
import javax.imageio.*;
import javax.xml.bind.DatatypeConverter;

import com.francisli.processing.http.*;

SimpleOpenNI  context;

PVector lastPoint = null;
double lastDistance = Double.MAX_VALUE;

void setup()
{
  size(640, 480);
  
  // instantiate a new context  
  context = new SimpleOpenNI(this);

  // enable depthMap generation 
  context.enableDepth();
  context.enableRGB();

  // create a window the size of the depth information
  size(context.depthWidth(), context.depthHeight());
}

/**
 * Called by Processing / PApplet contract at a rate the runtime can handle (seems pretty fast)
 */
void draw()
{
  // update the camera
  context.update();

  // draw rgb image
  image(context.rgbImage(), 0, 0);
}

/**
 * Called by the user pressing the mouse onto a point on the canvas. This is actually quite 
 * slow to respond, not sure why.
 */
void mousePressed() {
  println("mousePressed invoked");
  int clickedPosition = mouseX + (mouseY * 640);
  PVector clickedPoint = context.depthMapRealWorld()[clickedPosition];
  if(null != lastPoint) {
      double xd = lastPoint.x - clickedPoint.x;
      double yd = lastPoint.y - clickedPoint.y;
      double zd = lastPoint.z - clickedPoint.z;
      double latest = Math.sqrt((xd*xd) + (yd*yd) + (zd*zd));
      println("distance is "+latest);
      lastDistance = latest;
  }
  lastPoint = clickedPoint;
  
  println("this point is "+clickedPoint);
  println("last point is "+lastPoint);
}
