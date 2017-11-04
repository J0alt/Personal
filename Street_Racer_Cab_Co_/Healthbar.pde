void Healthbar() {
  float h=23;
  fill(255);
  rectMode(CENTER);
  rect(width-width/3.65,30, 315, 30);
  if (screen==2 && health<=0) {
    screen=3;
  }
if(health<=0){
  health=0;
}
  fill(255, 50, 50);
  rectMode(CORNER);
  rect(width-315, 19, health*3, h);
  if (hit==true) {
    if ((millis()-InvincT)/1000>=0.5) {
      hit=false;
    }
  }
  if(hit==false){
    if(health>=0.5){
  health+=0.01;
    }
  if(health>=100){
    health=100;
  }
 
  }
}