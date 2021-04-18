class Particle {
  Vector pos;
  Vector vel;

  public Particle(Vector pos) {
    this.pos = pos;
    this.vel = new Vector(0, 0);
  }

  void update() {
    this.pos.add(this.vel);
  }

  void display() {
    shape(circle, this.pos.x, this.pos.y);
  }
}