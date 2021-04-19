class Particle {
  Vector pos;
  Vector vel;

  public Particle(Vector pos) {
    this.pos = pos;
    this.vel = new Vector(0, 0);
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    point(pos.x, pos.y);
  }
}