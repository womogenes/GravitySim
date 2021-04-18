class Particle {
  Vector pos;
  Vector vel;
  float r;

  public Particle(Vector pos, float r) {
    this.pos = pos;
    this.vel = new Vector(0, 0);
    this.r = r;
  }

  void update() {
    this.pos.add(this.vel);
  }

  void display() {
    ellipse(this.pos.x, this.pos.y, this.r, this.r);
  }
}