class ParticleEmitter {

  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector pos;
  PVector ang;
  PVector initialPForce;
  PVector initialDirection;
  PVector target;
  boolean isAlwaysActive;
  float mag;

  ParticleEmitter(PVector xy, float initMag, PVector aimLocation, boolean alwaysOn) {
    this.pos = xy.copy();
    this.isAlwaysActive = alwaysOn;
    this.target = aimLocation.copy();
    this.mag = initMag;


  }

  void activate() {

    this.initialDirection = this.target.copy().sub(this.pos).normalize();
    this.initialPForce = this.initialDirection.copy().mult(this.mag);
    particles.add(new Particle(this.pos.copy().add(random(-25,25),random(-25,25)), initialPForce, color(100,100,255)));
    // println(this.initialDirection);
    // println(this.initialPForce);

  }

  void render() {

    fill(255);
    stroke(0);
    // rotate(this.initialDirection.x * cos());
    ellipse(this.pos.x, this.pos.y, 50, 50);
    renderParticles();

  }

  void renderParticles(){

    if (particles.size() > 0){
      // int index = 0;
      ArrayList<Particle> removeList = new ArrayList<Particle>();
        for(Particle particle : particles){
          if (!particle.colliding()){
            // particle.colliding();
            particle.update();
            particle.render();
          } else removeList.add(particle);
          // index++;
        }
      particles.removeAll(removeList);
    }
  }

  void setPos(float x, float y){
    // println("setting pos! curr pos: " + pos.x + " " + pos.y;
    this.pos.x = x;
    this.pos.y = y;

  }


}
