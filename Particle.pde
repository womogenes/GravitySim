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
    stroke(getColor(vel.mag() / 10));
    point(pos.x, pos.y);
  }
}