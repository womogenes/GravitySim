class Vector {
  float x, y;

  public Vector(float x, float y) {
    this.x = x;
    this.y = y;
  }

  boolean equals(Vector other) { return x == other.x && y == other.y; }

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

  float mag() {
    return (float) Math.sqrt(magSquared());
  }

  void normalize() {
    mult(1 / ((float) Math.sqrt(magSquared())));
  }
}