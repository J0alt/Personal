void Endgame(){
  if(screen==3){
  fill(255,0,0);
  textSize(200);
  textAlign(CENTER);
  text("Rekt",width/2,height/2);
  textSize(30);
  text("Click to go back",width/2,height/2+50);
  if(mousePressed){
  screen=1;
  health=100;
  mousePressed=false;
  }
  fill(#FB8B24);
}
}