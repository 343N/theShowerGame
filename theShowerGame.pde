
ParticleEmitter emitter;
ArrayList<Dirt> dirtArray = new ArrayList<Dirt>();
float power;
float x1;
float y1;
float x2;
float y2;
int sizeMin = 10;
int sizeMax = 20;
int dirtCount = 20;
int dmgVal = 5;
String fps = "";
int highScore = 100;
boolean hasPlayed = false;
int startTime = 0;

void setup(){

  size(400, 700, P2D);
  power = 8;
  emitter = new ParticleEmitter(new PVector(0,0), power, new PVector(width/2, height/2), false);
  startTimer();

  x1 = (width / 8) * 3;
  y1 = (height / 8) * 2;
  x2 = (width / 8) * 2;
  y2 = (height/8) * 4;
  for (int i = 0; i < dirtCount; i++){
    dirtArray.add(new Dirt(random(x1, x2 + x1), random(y1, y2 + y1), random(sizeMin,sizeMax)));
  }

}


void draw(){

  background(50,50,50);
  fill(255);

  stroke(0);
  rect(x1, y1, x2, y2);
  emitter.setPos(mouseX, mouseY);
  emitter.render();
  ArrayList<Dirt> removeDirtList = new ArrayList<Dirt>();
  ArrayList<Particle> removePList = new ArrayList<Particle>();
  int fallingCount = 0;
  if (dirtArray.size() > 0){
    for (Dirt dirt : dirtArray){
      dirt.render();
      for(Particle particle : emitter.particles){
        if (dirt.isColliding(particle.pos.x, particle.pos.y)){
          removePList.add(particle);
          dirt.takeDmg(dmgVal);
          if (dirt.rad <= dmgVal) {
            dirt.falling = true;
            dirt.col = color(124, 78, 70);
          }
        }
      }

      if (dirt.falling){
        fallingCount++;
      }
      if (dirt.isOffScreen()){
        removeDirtList.add(dirt);
        fallingCount--;
      }
    }
  }
  // stroke(255);
  fill(255);
  textAlign(LEFT);
  textSize(14);
  text("FPS: " + frameRate, 10, 20);
  text("Dirt particles: " + dirtArray.size() + " ("+fallingCount+" falling)", 10, 40);
  text("Emitter particles: " + emitter.particles.size(), 10, 60);

  textAlign(CENTER,TOP);
  textSize(20);
  text("" + compareTimeToNow(startTime), width/2, 64);
  if (hasPlayed) text("High Score: " + highScore, width/2, 128);


  dirtArray.removeAll(removeDirtList);
  emitter.particles.removeAll(removePList);
  if (dirtArray.size() < 1){
    if (compareTimeToNow(startTime) < highScore) highScore = compareTimeToNow(startTime);
    // highScore = ;
    hasPlayed = true;
    startTimer();
    for (int i = 0; i < dirtCount; i++){
      dirtArray.add(new Dirt(random(x1, x2 + x1), random(y1, y2 + y1), random(sizeMin,sizeMax)));
    }
  }

  if (mousePressed) {
    emitter.activate();
    // println("New particle made at " + emitter.pos.x +" " + emitter.pos.y);
    // println("New particle direction: " + emitter.initialDirection);
    // println("New particle force: " + emitter.initialPForce);
  }




}

int compareTimeToNow(int i){
  return (millis() / 1000) - i;
}

void startTimer(){
  startTime = millis() / 1000;
}


// void mousePressed(){
//
//
// }
