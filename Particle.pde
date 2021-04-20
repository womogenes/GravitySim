class Particle {
  Vector pos;
  Vector vel;
  float heat;

  public Particle(Vector pos, Vector vel) {
    this.pos = pos;
    this.vel = vel;
    this.heat = 1;
  }

  void update() {
    pos.add(mult(vel, dt));
    this.heat *= 0.99;
  }

  void display() {
    stroke(getColor(this.heat / 15));
    point(pos.x, pos.y);
  }
}