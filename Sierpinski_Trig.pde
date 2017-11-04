
int val=1;

void setup() {
  size(800, 600);
}
void draw() {
  background(255);
  fill(0);
  noStroke();
  line(width/2, height/7, width/5, height-(height/7));
  line(width/2, height/7, width-(width/5), height-(height/7));
  line(width/5, height-(height/7), width-(width/5), height-(height/7));
  drawTrig(val, new PVector(width/5, height-height/7), new PVector(width/2, height/7), new PVector(width-width/5, height-height/7));
}


void drawTrig(int num, PVector left, PVector right, PVector top) {

  num-=1;

  if (num>0) {
    PVector a = PVector.add(left, PVector.div(PVector.sub(top, left), 2));
    PVector b = PVector.add(right, PVector.div(PVector.sub(top, right), 2));
    PVector c = PVector.add(left, PVector.div(PVector.sub(right, left), 2));

    drawTrig(num, a, top, b);
    drawTrig(num, left, a, c);
    drawTrig(num, c, b, right);
  } else {
    triangle(left.x, left.y, top.x, top.y, right.x, right.y);
  }
}

void keyPressed(){
if(keyCode==RIGHT){
  val++;
}
if(keyCode==LEFT){
val--;
}
  redraw();

}