void Gamescreen(){
if (screen==2) {
  if(Dawson==true){
  DawsSong.play();
 } else if (Dawson==false){
 DawsSong.rewind();
 DawsSong.pause();
 }
  if(Daniel==true){
  DaniSong.play();
 } else if (Daniel==false){
 DaniSong.rewind();
 DaniSong.pause();
 }
  if(Caleb==true){
  CaleSong.play();
 } else if (Caleb==false){
 CaleSong.rewind();
 CaleSong.pause();
 }
 if(Shvm==true){
  ShvmSong.play();
 } else if (Shvm==false){
 ShvmSong.rewind();
 ShvmSong.pause();
 }
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