class Player {
  float pr=50, pg=50, pb=255;
  Player() {
  }


  void update() {

    boolean moving=false, movingL=false, movingR=false, movingU=false, movingD=false;

    rectMode(CENTER);
    //////Stopped\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (stopped==true) {
      ///////mid lane change stop prevention\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      if (playerX>50 && playerX<99) {
        playerX=50;
      } else if (playerX>150 && playerX<199||playerX>99 && playerX<150) {
        playerX=150;
      } else if (playerX>250 && playerX<299||playerX>199 && playerX<250) {
        playerX=250;
      } else if (playerX>350 && playerX<399||playerX>299 && playerX<350) {
        playerX=350;
      } else if (playerX>450 && playerX<499||playerX>399 && playerX<450) {
        playerX=450;
      } else if (playerX>499 && playerX<550) {
        playerX=550;
      }
      ////////value resets\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
      playerXO=playerX;
      playerYO=playerY;
      accel=0;
      velX=0;
      velY=0;
      PTx=0;
      PTy=0;
      Pangle=0;
      moving=false;
    }  
    if (moving==false) {
      if (keyCode==LEFT) {
        movingL=true;
        moving=true;
      }
      if (keyCode==RIGHT) {
        movingR=true;
        moving=true;
      }
      if (keyCode==UP) {
        movingU=true;
        moving=true;
      }
      if (keyCode==DOWN) {
        movingD=true;
        moving=true;
      }
    }
    /////movement\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    /////Left\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (movingL==true && playerX>=50) {
      accel=gameSpeed;
      stopped=false;
      playerX-=velX;
      velX+=accel;
      Pangle-=1;
      PTx-=10;
      PTy+=5; 
      if (playerX<=playerXO-30) {
        velX-=accel;
        PTx+=10;
        PTy-=5;
        Pangle+=1;
      }
      if(playerX<=50.5){
        playerX=50;
        accel=0;
        velX=0;
        Pangle=0;
        keyCode=0;
        stopped=true;
        movingL=false;
      }
      if (playerX<=playerXO-95) {
        accel=0;
        velX=0;
        Pangle=0;
        keyCode=0;
        stopped=true;
        movingL=false;
        
      }

      //////Right\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    } else if (movingR==true && playerX<=width-50) {   
      accel=gameSpeed;
      stopped=false;
      playerX+=velX;
      velX+=accel;
      Pangle+=1;
      PTx+=10;
      PTy-=5;
      if (playerX>=playerXO+30) {
        velX-=accel;
        Pangle-=1;
        PTx-=10;
        PTy+=5;
      }
      if(playerX>=549.5){
        playerX=550;
        accel=0;
        velX=0;
        Pangle=0;
        keyCode=0;
        stopped=true;
        movingR=false;
      }
      if (playerX>=playerXO+95) {
        accel=0;
        velX=0;
        Pangle=0;
        keyCode=0;
        stopped=true;
        movingR=false;
      }

      /////Up\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    } else if (movingU==true && playerY>=height/12) {
      accel=gameSpeed;
      stopped=false;
      playerY-=velY;
      velY+=accel;
      if (playerY<=playerYO-30) {
        velY-=accel;
      }
      if (playerY<=playerYO-95) {
        accel=0;
        velY=0;
        keyCode=0;
        stopped=true;
        movingU=false;
      }

      //////Down\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    } else if (movingD==true && playerY<=height-height/12) {
      accel=gameSpeed;
      stopped=false;
      playerY+=velY;
      velY+=accel;
      if (playerY>=playerYO+30) {
        velY-=accel;
      }
      if (playerY>=playerYO+95) {
        accel=0;
        velY=0;
        keyCode=0;
        stopped=true;
        movingD=false;
      }
    }
  }
  ////////////collision\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  void collision() {
    for (int q = 0; q<rowsOb; q++) {
      for (int w = 0; w<colsOb; w++) {
        if (/*left side collision*/(playerX+20>=oncar[q][w].obX()-wOb/2 && playerX-20>=(oncar[q][w].obX()-wOb/2)-40 && playerX+20<=oncar[q][w].obX() && playerY+35>=oncar[q][w].obY()-hOb/2 && playerY-35<=oncar[q][w].obY()+hOb/2) || /* right side collision */(playerX-20<=oncar[q][w].obX()+wOb/2 && playerX+20<=(oncar[q][w].obX()+wOb/2)+40 && playerX-20>=oncar[q][w].obX() && playerY+35>=oncar[q][w].obY()-hOb/2 && playerY-35<=oncar[q][w].obY()+hOb/2)) {
          oncar[q][w].damage();
        } else if (/* top of player collision */(playerY-35<=oncar[q][w].obY()+hOb/2 && playerY+35>=oncar[q][w].obY() && playerX-20<=oncar[q][w].obX()+wOb/2 && playerX+20>=oncar[q][w].obX()-wOb/2) ||  /*bottom of player collision */ (playerY+35>=oncar[q][w].obY()-hOb/2 && playerY-35<=oncar[q][w].obY() && playerX-20<=oncar[q][w].obX()+wOb/2 && playerX+20>=oncar[q][w].obX()-wOb/2)) {
          oncar[q][w].damage();
        } else if ((keyCode==40 && playerY>=725 || keyCode==38 && playerY<=70 || keyCode>=1 && keyCode<=36 || keyCode>=41 && keyCode<=222) && playerX%50!=0) {
          keyCode=0;  
          screen=3;
        }
      }
    }
  }

  ////////////display\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  void display() {
    if (Shvm==true) {
      pr=random(255);
      pg=random(255);
      pb=random(255);
    } else if (Shvm==false) {
      pr=50;
      pg=50;
      pb=255;
    }
    pushMatrix(); 
    translate(playerX, playerY); 
    rotate(radians(Pangle)); 
    fill(pr, pg, pb); 
    rect(0, 0, 40, 70);  
    if(Dawson==true){
    Grif.resize(40,70);
    image(Grif,-20,-35);
    }
    if(Daniel==true){
      CTree.resize(40,70);
      image(CTree,-20,-35);
    }
    popMatrix();
  }
}