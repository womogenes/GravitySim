class Vector {
  float x, y;

  public Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void add(Vector b) {
    x += b.x;
    y += b.y;
  }

  void sub(Vector b) {
    x -= b.x;
    y -= b.y;
  }

  void mult(float scalar) {
    x *= scalar;
    y *= scalar;
  }

  float magSquared() {
    return x * x + y * y;
  }

  void normalize() {
    mult(1 / ((float) Math.sqrt(magSquared()))); // Yeah I could probably use Fast Inverse Square Root as well but ¯\_(ツ)_/¯
  }
}