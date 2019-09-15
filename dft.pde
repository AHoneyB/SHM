ArrayList<Complex> dft(ArrayList<Float> x) {

  ArrayList<Complex> X = new ArrayList<Complex>();
 
  int N = x.size();
  int num =x.size();

  for (int k=0; k<num; k++) {

    float re = 0;
    float im = 0;

    for (int n=0; n<N; n++) {
      float phi = (TWO_PI * k * n) / N;
      re += x.get(n) * Math.cos(phi);
      im -= x.get(n) * Math.sin(phi);
    }
    re = re/N;
    im = im/N;
    
    Complex c = new Complex(re, im);
    c.freq =k;
 
    X.add(k, c);
  }


  return X;
}
