class Signal {

  ArrayList<Float> phi;            //Signal

  Signal() {
    phi = new ArrayList<Float>();
  }

  void lino() {
    for (int i=0; i<100; i++) {
      phi.add((float)i*0.1);
    }
  }


  void rando() {
    for (int i=0; i<100; i++) {
      phi.add(random(-10, 10));
    }
  }

  void noX() {
    float angle =0;
    for (int i=0; i<200; i++) {
      phi.add((100*noise(angle+HALF_PI)-20)*0.4);
      angle += TWO_PI /200;
    }
  }
  
  void noY() {
    float angle =0;
    for (int i=0; i<200; i++) {
      phi.add((100*noise(angle)-20)*0.4);
      angle += TWO_PI /200;
    }
  }

  void sineWave() {
    for (int i=0; i<100; i++) {
      float angle =map(i, 0, 100, 0, TWO_PI);
      phi.add(10*sin(angle));
    }
  }

  void cosineWave() {
    for (int i=0; i<100; i++) {
      float angle =map(i, 0, 100, 0, TWO_PI);
      phi.add(10*cos(angle));
    }
  }

  void squareWave() {

    for (int i=0; i<8; i++) {  
      for (int j=0; j<30; j++) {
        if (i % 2 == 0) 
          phi.add(0.0);
        else
          phi.add(10.0);
      }
    }
  }
}
