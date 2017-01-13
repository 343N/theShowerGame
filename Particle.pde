class Particle {

  PVector pos;
  PVector acc = new PVector(0,0);
  PVector vel;
  PImage texture;
  color col;
  float alpha;

  Particle(PVector xy, PVector sVel, color newPcolor){
    this.pos = xy.copy();
    this.vel = sVel.copy();
    this.col = newPcolor;

  }

  Particle(PVector xy, PVector sVel, PImage newImage){
    this.pos = xy.copy();
    this.vel = sVel.copy();
    this.texture = newImage;
  }

  Particle(PVector xy, PVector sVel, PImage newImage, float alpha){
    this.pos = xy.copy();
    this.vel = sVel.copy();
    this.texture = newImage;
    this.alpha = alpha;

  }

  void update(){

    this.acc.x = this.acc.x * -0.001;
    this.acc.y += .005;
    this.vel.add(this.acc);
    this.pos.add(this.vel);

  }

  void render(){
    stroke(this.col);
    line(this.pos.x, this.pos.y, this.vel.x + this.pos.x, this.vel.y + this.pos.y);


 }

 boolean colliding(){
  //  return false;
  //  if (this.pos.x > x1 && this.pos.y > y1 && this.pos.x < (x2 + x1) && this.pos.y < (y2+y1)){
  //    println(true);
  //    return true;
  //  } else return false;

   //
   if (this.pos.y > height){
     return true;
   } else return false;

 }


}
