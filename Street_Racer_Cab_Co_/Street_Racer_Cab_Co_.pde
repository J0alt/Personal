import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

/////////music\\\\\\\\\\\\\\\\\\\\
Minim minim;
AudioPlayer SSong;
AudioInput input;


Player[] thePlayer = new Player [1];
oncoming[][] oncar;
roadLn[][] road;
/////////////road lines\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
int cols=7;
int rows=10;
//////////////////////////screen variables\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
int screen=1;
int score=0;
int timeS;
String text="Crash";
////////obstacle variables\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
int colsOb=5;
int rowsOb=5;
float wOb=20, hOb=40;
float gameSpeed=1;
/////////////////////player variables\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
float playerX, playerY, Pangle, PTx, PTy;
float health=100;
float InvincT=0;
float distance;
float playerXO, playerYO;
float velX, velY, accel;
boolean stopped=true;
boolean hit=false;


void setup() {
  frameRate(60);
  size(600, 800);
  playerX=width/2+50;
  playerY=height-height/5;
  minim = new Minim(this);
  SSong= minim.loadFile("DPAero.mp3");
  input = minim.getLineIn();
  road = new roadLn[cols][rows];
  oncar = new oncoming[colsOb][rowsOb];
  for (int j = 0; j<rows; j++) {
    for (int i = 0; i<cols; i++) {
      road[i][j] = new roadLn(i*100, j*92, 4, 60);
    }
  }
  for (int e = 0; e < thePlayer.length; e++) {
    thePlayer[e] = new Player();
  }
  for (int q = 0; q<rowsOb; q++) {
    for (int w = 0; w<colsOb; w++) {
      oncar[q][w] = new oncoming(random(0, 6), random(500, 1000), random(25, 50), random(45, 75), random(100, 255), random(100, 255), random(100, 255));
    }
  }
}

void draw() {
  Gamescreen();
  textSize(30);
  textAlign(CORNER);
  if (screen==1 || screen==2) {
    score=millis()-timeS;
  }
  text("Score: "+score/1000, 20, 35);
  Healthbar();
  Endgame();
  if (text!="rekt") {
    text="NO!!!";
  }
  Mainmenu();
  Instructions();
  SSong.play();
  if(!SSong.isPlaying()){
    SSong.pause();
    SSong.rewind();
  }

  if (text!="Crashed") { 
    text="Crashed";
  }
}