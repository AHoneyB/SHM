PVector epiCycles(float x,float y, float rotation, ArrayList<Complex> fourier){

for (int i=0; i<fourier.size(); i++) {
    float px =x;
    float py =y;

    float freq =   fourier.get(i).freq;
    float radius = fourier.get(i).amp*10;
    float phase =  fourier.get(i).phase;

    x+= radius * (float)(Math.cos(freq*time + phase + rotation));
    y+= radius * (float)(Math.sin(freq*time + phase + rotation));

    stroke(0, 50);
    ellipse(px, py, 2*radius, 2*radius);
    stroke(0);
    strokeWeight(2);
    line(px, py, x, y);
  }
  return new PVector(x,y);
}
