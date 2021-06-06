class Particle {
  Vector pos;
  Vector vel;
  Vector nextPos;
  Vector nextVel;
  float heat;

  public Particle(Vector pos, Vector vel) {
    this.pos = pos;
    this.vel = vel;
    this.nextPos = pos.copy();
    this.nextVel = vel.copy();
    this.heat = 1;
  }

  void update() {
    pos.add(mult(vel, dt));
    this.heat *= 0.999;
  }

  void display() {
    stroke(getColor(this.heat / 15));
    point(pos.x, pos.y);
  }
}