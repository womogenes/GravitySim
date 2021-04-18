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

  void mult(float scalar) {
    x *= scalar;
    y *= scalar;
  }
}