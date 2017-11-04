void TotalReset(){
 playerX=width/2+50;
        playerY=height-height/5;
        playerXO=playerX;
        playerYO=playerY;
        for (int q = 0; q<rowsOb; q++) {
          for (int w = 0; w<colsOb; w++) {
            oncar[q][w].lane=random(0, 6);
            oncar[q][w].lane1s=1;
            oncar[q][w].lane2s=1.5;
            oncar[q][w].lane3s=1.7;
            oncar[q][w].lane4s=2;
            oncar[q][w].lane5s=2.4;
            oncar[q][w].lane6s=3;
            oncar[q][w].accel=0;
            oncar[q][w].oy=-(oncar[q][w].h/2+random(900));
          }
        }
        timeS=millis();
        InvincT=0;
        health=100;
}