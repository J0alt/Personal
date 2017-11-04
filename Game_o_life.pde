boolean[][] cell;
boolean[][] nxcell;
int[][] clr;
int col=160, row=160;
int prvtime;
int tooMany=3, tooFew=2, enough=3;
boolean paused=false;

void setup() {
  size(800, 800);
  cell = new boolean[col][row];
  nxcell = new boolean[col][row];
  clr = new int[col][row];
  for (int q=0; q<col; q++) {
    for (int w=0; w<row; w++) {
      float choice = random(100);
      if (choice>75) {
        cell[q][w]=true;
      } else {
        cell[q][w]=false;
      }
    }
  }
}




void draw() {
  stroke(50);
  for (int q=0; q<row; q++) {
    for (int w=0; w<col; w++) {
     if (cell[q][w]==true) {
        clr[q][w]=0;
      } else {
        if(clr[q][w]!=255){
      clr[q][w]+=50;
        }
      }
      fill((w*3)-clr[q][w],0.2*q,(q*2)-clr[q][w]);
      rect(q*5, w*5, 5, 5);
    }
  }
if (millis()-prvtime>100) {
    Step();
prvtime=millis();
}
}






void Step() {
  if (paused==false) {
    for (int q=0; q<col; q++) {
      for (int w=0; w<row; w++) {
        nxcell[q][w] = cell[q][w];
      }
    }
    for (int q=0; q<col; q++) {
      for (int w=0; w<row; w++) {
        int surrounding=0;
        int subCol=q-1, subRow=w-1, plsCol=q+1, plsRow=w+1;

        if (subCol<0) {
          subCol=col-1;
        }
        if (plsCol==col) {
          plsCol=0;
        }
        if (subRow<0) {
          subRow=row-1;
        }
        if (plsRow==row) {
          plsRow=0;
        }
        
        
        //ml
        if (nxcell[subCol][w]==true) {
          surrounding+=1;
        }
        //mr
        if (nxcell[plsCol][w]==true) {
          surrounding+=1;
        }
        //tl
        if (nxcell[subCol][subRow]==true) {
          surrounding+=1;
        }
        //bl
        if (nxcell[subCol][plsRow]==true) {
          surrounding+=1;
        }
        //mt
        if (nxcell[q][subRow]==true) {
          surrounding+=1;
        }
        //mb
        if (nxcell[q][plsRow]==true) {
          surrounding+=1;
        }
        //tr
        if (nxcell[plsCol][subRow]==true) {
          surrounding+=1;
        }
        //br
        if (nxcell[plsCol][plsRow]==true) {
          surrounding+=1;
        }


        if (nxcell[q][w]==true) {
          if (surrounding>tooMany || surrounding<tooFew) {
            cell[q][w]=false;
          }
        } else {
          if (surrounding == enough) {
            cell[q][w]=true;
          }
        }
      }
    }
  }
}


void mouseClicked() {
  if (paused==false) {
    paused=true;
  } else {
    paused=false;
  }
}

void keyPressed() {
  if (key == 'q') {
    tooMany+=1;
    keyPressed=false;
  } 
  if (key == 'w') {
    tooMany-=1;
    keyPressed=false;
  }
  if (key == 'a') {
    tooFew+=1;
    keyPressed=false;
  } 
  if (key == 's') {
    tooFew-=1;
    keyPressed=false;
  }
  if (key == 'z') {
    enough+=1;
    keyPressed=false;
  } 
  if (key == 'x') {
    enough-=1;
    keyPressed=false;
  }
  println("| too many: "+ (tooMany+1), "| too few: " + tooFew, "| just enough: " + enough+ " | ");
}