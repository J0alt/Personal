class oncoming {
  float ox, oy;
  float w=40, h=60, cr, cg, cb;
  float accel;
  float lane;
  float lane1s=1, lane2s=1.5, lane3s=1.7, lane4s=2, lane5s=2.4, lane6s=3;

  oncoming(float lane_, float oy_, float w_, float h_, float cr_, float cg_, float cb_) {
    w=w_;
    h=h_;
    cr=cr_;
    cg=cg_;
    cb=cb_;
    lane=lane_;
    oy=-oy_;
  }

  float obX() {
    return ox;
  }
  float obY() {
    return oy;
  }


  ///////damage\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  void damage() {
    if (w<35 && h<55 && hit==false) {
      health=health-10;
      InvincT=millis();
      hit=true;
    }
    if (w>35 && h>55 && hit==false) {
      health=health-20;
      InvincT=millis();
      hit=true;
    }
    if (w>35 && h<55 && hit==false) {
      health=health-15;
      InvincT=millis();
      hit=true;
    }
    if (w<35 && h>55 && hit==false) {
      health=health-15;
      InvincT=millis();
      hit=true;
    }
  }

  void display() {
    //////////////////lane choice\\\\\\\\\\\\\\\\
    accel+=0.000001;
    lane1s+=accel;
    lane2s+=accel;
    lane3s+=accel;
    lane4s+=accel;
    lane5s+=accel;
    lane6s+=accel;
    //speed cap\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (lane1s>=5) {
      lane1s=5;
    }
    if (lane2s>=5.6) {
      lane2s=5.6;
    }
    if (lane3s>=5.8) {
      lane3s=5.8;
    }
    if (lane4s>=6) {
      lane4s=6;
    }
    if (lane5s>=6.4) {
      lane5s=6.4;
    }
    if (lane6s>=7.2) {
      lane6s=7.2;
    }
    //lane choice\\\\\\\\\\\\\\\\\\\\\\\\\\\
    if (lane>=0 && lane<=1) {
      ox= 50;
      oy+=lane1s;
    }
    if (lane<=2 && lane>1) {
      ox= 150;
      oy+=lane2s;
    }
    if (lane<=3 && lane>2) {
      ox= 250;
      oy+=lane3s;
    }
    if (lane<=4 && lane>3) {
      ox= 350;
      oy+=lane4s;
    }
    if (lane<=5 && lane>4) {
      ox= 450;
      oy+=lane5s;
    }
    if (lane<=6 && lane>5) {
      ox= 550;
      oy+=lane6s;
    }
    /////////////oncoming car looping\\\\\\\\\\\\\\\\\\\\\\\
    if (oy>=height+h/2) {
      oy=-(h/2+random(10, 1000));
      w=random(25, 50);
      h=random(45, 75);
      cr=random(100, 255);
      cg=random(100, 255);
      cb=random(100, 255);
      lane=random(0, 6);
    }
    //////////oncoming car vertical overlap prevention\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
    for (int q = 0; q<rowsOb; q++) {
      for (int w = 0; w<colsOb; w++) {
        if (oy+h/2>oncar[q][w].oy-oncar[q][w].h/2 && oy-h/2<oncar[q][w].oy-oncar[q][w].h/2 && ox==oncar[q][w].ox) {
          oy=-(h/2+random(900));
        }
      }
    }
    fill(cr, cg, cb);
    rect(ox, oy, w, h);
  }
}