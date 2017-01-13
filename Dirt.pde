class Dirt {

  float locX;
  float locY;
  float velX = 0;
  float velY = 0;
  float accX = 0;
  float accY = 0;
  float rad;
  color col;
  boolean falling = false;

  Dirt(float x, float y, float r){
    this.locX = x;
    this.locY = y;
    this.rad = r;
    this.col = color(62, 39, 35);
  }


  void render(){
    if (this.falling){
      this.accX = this.velX * -.025;
      this.accY = .25;
      this.velX += this.accX;
      this.velY += this.accY;
      this.locX += this.velX;
      this.locY += this.velY;
    }
    fill(this.col);
    stroke(0);
    ellipse(this.locX, this.locY, this.rad+random(2,-2), this.rad + random(2,-2));
  }

  void takeDmg(int a){
    this.rad -= a;
  }


  boolean isColliding(float x, float y){
    if (this.locX < x && this.locX + this.rad > x && this.locY < y && this.locY + this.rad > y && !this.falling){
      this.velX = random(-2, 2);
      this.velY = random(-1, -2);
      return true;
    } else return false;

  }

  boolean isOffScreen(){
    if (this.locX > width || this.locX < 0 || this.locY > height){
      return true;
    } else return false;
  }

}
