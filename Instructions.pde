void Instructions(){
  if(screen==4){
    background(0);
 ///////player and road,etc\\\\\\\\\\\\\\\\\\\\\\
  for (int j = 0; j<rows; j++) {
      for (int i = 0; i<cols; i++) {
        road[i][j].display();
      }
    }
    for (int e = 0; e < thePlayer.length; e++) {
      thePlayer[e].display();
      thePlayer[e].update();
      thePlayer[e].collision();
    }
    if(millis()-timeS>15000){
    for (int q = 0; q<rowsOb; q++) {
      for (int w = 0; w<colsOb; w++) {
        oncar[q][w].display();
      }
    }
    }
    if(mousePressed){
      screen=1;
    }
    if(hit==false){
      health=100;
    }
    textSize(30);
    score=0;
    textAlign(CORNER);
    fill(255);
    text("Score: "+score/1000,20,35);
    Healthbar();
    
    fill(0,255,0);
    textSize(30);
    if(millis()-timeS<3000){
    text("<- you",playerX+50,playerY);
    }
    if(millis()-timeS>500 && millis()-timeS<3000){
    text("Move with the arrow keys",playerX-150,playerY+70);
    }
    if(millis()-timeS>3000 && millis()-timeS< 9000){
    text("Ways to crash:",25,300);
    if(millis()-timeS>3500 && millis()-timeS< 9000){
    text("~Pressing a key while between lanes",25,350);
    }
    if(millis()-timeS>4000 && millis()-timeS< 9000){
    text("~Trying to get stuck between lanes",25,400);
    }
    if(millis()-timeS>4500 && millis()-timeS< 9000){
    text("~Getting hit by cars to much",25,450);
    }
    }
    if(millis()-timeS>9000 && millis()-timeS< 12000){
      text("This is a practice mode so you won't die",width/2-285,height/2);
    }
    if(millis()-timeS>12000 && millis()-timeS< 15000){
      text(" ^ those are enemies ^",width/2-150,height/2);
      text("don't touch them or you lose health",width/2-250,height/2+30);
      text("Size of enemy=Damage of enemy",width/2-220,height/2+60);
    }
    if(millis()-timeS>15000){
    text("Click to go back",350,70);
    }
  }
}