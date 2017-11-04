class roadLn {
  float lx, ly, w, h;
  roadLn(float lx_,float ly_,float w_, float h_){
 lx=lx_;
 ly=ly_;
 w=w_;
 h=h_;
 }
  
  void display(){
    ///////line movement\\\\\\\\\\\\\\\\\\\
    ly+=15;
if(ly>=height+h){
ly=-h;
 }
  fill(255);
 rect(lx,ly,w,h);
  }
}
    
    
  