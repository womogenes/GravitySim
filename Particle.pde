class Particle {
  Vector pos;
  Vector vel;
  Vector nextPos;
  Vector nextVel;
  float heat;

  public Particle(Vector pos) {
    this.pos = pos;
    this.vel = new Vector(0, 0);
    this.heat = 1;
    this.nextPos = pos.copy();
    this.nextVel = vel.copy();
  }

  void update() {
    pos.add(mult(vel, dt));
    this.heat *= 0.99;
  }

  void display() {
    stroke(getColor(this.heat / 10));
    point(pos.x, pos.y);
  }
}