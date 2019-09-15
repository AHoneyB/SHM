import java.util.Collections;   

int num;
float time; 
Signal su,sv;
ArrayList<PVector> path;

float x, y;
ArrayList<Float> u;
ArrayList<Float> v;
ArrayList<Complex> fourierX;
ArrayList<Complex> fourierY;

void setup() {
  size(1000, 800);
  su = new Signal();
  //su.cosineWave();
  su.noX();
  sv = new Signal();
  sv.noY();
  u = su.phi;
  v = sv.phi;
  path = new ArrayList<PVector>();

  fourierX = dft(u);
  fourierY = dft(v);

 
  
  

  frameRate(25);
}

void draw() {
  background(255);

  stroke(0);
  noFill();
  // SORT BY frequnecy
  ComplexSorter complexSortX = new ComplexSorter(fourierX);
  ComplexSorter complexSortY = new ComplexSorter(fourierY);
  ArrayList<Complex> fourierXSorted =complexSortX.getSortedbyAmp();
  ArrayList<Complex> fourierYSorted =complexSortY.getSortedbyAmp() ;

 PVector uVec=epiCycles(500,100,0,fourierXSorted);
 PVector vVec=epiCycles(100,500,HALF_PI,fourierYSorted);
 PVector vDraw = new PVector(uVec.x,vVec.y); 
  
 line(uVec.x, uVec.y, vDraw.x, vDraw.y);
 line(vVec.x, vVec.y, vDraw.x, vDraw.y); 
  
  path.add(0, vDraw);

  beginShape();
  for ( int i=0; i<path.size(); i++ ) {
    vertex(path.get(i).x, path.get(i).y);
  }
  endShape();
 

  float dt = TWO_PI/fourierY.size();
  time -=dt;
  time = time % TWO_PI;

  //if (wave.size()>800)
  //  wave.remove(wave.size()-1);
}


class Complex implements Comparable<Complex> {
  float re;
  float im;
  float freq;
  float amp;
  float phase;

  Complex(float r, float i) {
    re =r;
    im =i;
    amp = (float)sqrt(re*re+im*im);
    phase =atan2(im, re);
  }
  
  @Override     
  public int compareTo(Complex number) {
    return (this.amp < number.amp ? -1 : 
            (this.amp == number.amp  ? 0 : 1)); 
  }
  
  String toSting() { 
    return "("+re+","+im+")";
  }
}

class ComplexSorter {

  ArrayList<Complex> listOfComplexnumbers;
  
  ComplexSorter(ArrayList<Complex> listOfComplexnumbers){
    this.listOfComplexnumbers=listOfComplexnumbers;
  }

  ArrayList<Complex> getSortedbyAmp(){
    Collections.sort(listOfComplexnumbers);
    return listOfComplexnumbers;
  }

}
