void Mainmenu() {
  color ar=207,ag=92,ab=54;
  color b = 0;
  color cr=251,cg=139,cb=36;
  color d = 0;
  rectMode(CENTER);
  textAlign(CENTER);
  if (screen==1) {       
    background(0);
    /////////start game button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (mouseX>=width/2-210 && mouseX<=width/2+210 && mouseY<=height/3+50 && mouseY>=height/3-50) {
      ar=237;
      ag=122;
      ab=84;
      b=50;
      if (mousePressed) {
       TotalReset();
        screen=2;
      }
    } else {
      ar=207;
      ag=92;
      ab=54;
      b=0;
    }
    ////////instructions button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (mouseX>=width/2-210 && mouseX<=width/2+210 && mouseY<=height/1.5+50 && mouseY>=height/1.5-50) {
       cr=255;
      cg=159;
      cb=56;
      d=50;
      if (mousePressed) {
        TotalReset();
        timeS=millis();
        mousePressed=false;
       screen=4;
      }
    } else {
      cr=251;
      cg=139;
      cb=36;
      d=0;
    }
/////////player and road during menu screen\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
     for (int j = 0; j<rows; j++) {
      for (int i = 0; i<cols; i++) {
        road[i][j].display();
      }
    }
    for (int e = 0; e < thePlayer.length; e++) {
      thePlayer[e].display();
      thePlayer[e].update();
    }
    ///////game button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    fill(ar,ag,ab);
    rect(width/2, height/3, 420, 100);
    fill(b);
    textSize(60);
    text("Ready to race?", width/2, height/3+20);
    ///////instructions button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    fill(cr,cg,cb);
    rect(width/2,height/1.5,420,100);
    fill(d);
    text("Learn to play",width/2,height/1.5+20);
    textSize(30);
    score=0;
    textAlign(CORNER);
    fill(255);
    text("Score: "+score/1000,20,35);
    Healthbar();
  }
}