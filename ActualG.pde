PImage img;
PrintWriter output;
int[][] val;
int[][] val2;
int num=20;
float xdiff=0.28;
float ydiff=0.28;
int zmax=2500;
int arrayX=171, arrayY=210;
float max=109;
int shade=0;
void setup() {
  //////////////////////////////////////CREATING THE TXT FILE
  output = createWriter("GCode.txt");
  ///////////////////////////////////////STARTING UP THE CNC
  output.println("N100G00G20G17G90G40G49G80");
  output.println("N110G70G91.1");
  output.println("N120T1M06");
  output.println("N130 (Tool: INSERT TOOL TYPE)");
  output.println("N140G00G43Z0.8000H1");
  output.println("N150S12000M03");
  output.println("N160(Toolpath: INSERT TOOL PATH)");
  output.println("N170()");
  output.println("N180G94");
  output.println("N190X0.0000Y0.0000F60.0");
  output.println("N200G00X1.0284Y0.9907Z0.2000");
  size(342, 210);
  val = new int[arrayX][arrayY];
  val2 = new int[arrayX][arrayY];
  img = loadImage("bjork.PNG");  
  img.resize(171, 210);
  background(255);                       
  image(img, 0, 0);
  loadPixels();
  for (int q=0; q<arrayX; q+=1) {
    for (int w=0; w<arrayY; w+=1) {
      int col = get(q, w);
      val[q][w] = int(red(col)*0.2126+green(col)*0.7152+blue(col)*0.0722);
      if (q%5==0 && w%5==0 && q>1 && q<arrayX-1 && w>1 && w<arrayY-1) {
        for (int e=-2; e<+2; e++) {
          for (int r=-2; r<+2; r++) {
            val2[q][w]+=val[q+e][w+r];
          }
        }
        //if(val2[q][w]/25>max){
        //max = val2[q][w]/25;
        //println(max);
        //}
        if (val2[q][w]/25<max-shade) {
          strokeWeight(map(val2[q][w]/25, max, 0, 0, 5));
          point(q+arrayX, w);
        }
        ///////////////////////////////////////WRITING THE DEPTH
        if (val2[q][w]/25<max-shade) {
          num++;
          output.print("N"+num*10+"G1");
          output.print("X"+q/5*xdiff);
          output.print("Y"+w/5*ydiff);
          output.println("Z"+map((val2[q][w]/25), max, 0, -zmax, 0)/10000);
        }
      }
    }
  }
  num++;
  output.println("N"+num*10+"G00X1.0284Y0.9907Z0.2000");
  num++;
  output.println("N"+num*10+"G00Z0.8000");
  num++;
  output.println("N"+num*10+"G00X0.0000Y0.0000");
  num++;
  output.println("N"+num*10+"M09");
  num++;
  output.println("N"+num*10+"M30");
  output.println("%");
  output.flush();
  output.close();
  //exit();
}