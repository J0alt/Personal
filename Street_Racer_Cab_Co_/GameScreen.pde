void Gamescreen(){
if (screen==2) {
    background(0);
gameSpeed+=0.00001;
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
    for (int q = 0; q<rowsOb; q++) {
      for (int w = 0; w<colsOb; w++) {
        oncar[q][w].display();
      }
    }
    }
}