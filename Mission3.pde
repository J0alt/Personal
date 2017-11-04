import processing.video.*;
Capture vid;
int[][] val;
int[][] val2;
int arrayX=640, arrayY=480;
float max=255;
int shade=0;
void setup() {
  size(640, 480);
  val = new int[arrayX][arrayY];
  val2 = new int[arrayX/5][arrayY/5];
  vid = new Capture(this, 640, 480, 15);
  vid.start();
  rectMode(CENTER);
}

void captureEvent(Capture vid) {
  vid.read();
}

void draw() {
  image(vid, 0, 0);
  loadPixels();
  for (int q=0; q<arrayX; q+=1) {
    for (int w=0; w<arrayY; w+=1) {
      int col = get(q, w);
      val[q][w] = int(red(col)*0.2126+green(col)*0.7152+blue(col)*0.0722);
      if (q%5==0 && w%5==0 && q>1 && q<arrayX-1 && w>1 && w<arrayY-1) {
        for (int e=-2; e<+2; e++) {
          for (int r=-2; r<+2; r++) {
            val2[q/5][w/5]+=val[q+e][w+r];
          }
        }
      }
    }
  }
  strokeWeight(0);
  background(255);
  for (int q=0; q<arrayX/5; q+=1) {
    for (int w=0; w<arrayY/5; w+=1) {
      if (val2[q][w]/25<max) {
        float sum = map(val2[q][w]/25, max, shade, 0, 6);
        val2[q][w]=0;
        strokeWeight(sum);
        if (sum <= 1) {
          stroke(255);
        } else {
          stroke(0);
        }
        point(arrayX-q*5, w*5);
      }
    }
  }
}