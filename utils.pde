float dist(Vector a, Vector b) {
  return (float) Math.sqrt(distSquared(a, b));
}

float distSquared(Vector a, Vector b) {
  return (a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y);
}

Vector add(Vector a, Vector b) {
  return new Vector(a.x + b.x, a.y + b.y);
}

Vector sub(Vector a, Vector b) {
  return new Vector(a.x - b.x, a.y - b.y);
}

Vector mult(Vector a, float scalar) {
  return new Vector(a.x * scalar, a.y * scalar);
}

float dot(Vector a, Vector b) {
  return a.x * b.x + a.y * b.y;
}

// From https://stackoverflow.com/questions/11513344/how-to-implement-the-fast-inverse-square-root-in-java
public static float invSqrt(float x) {
  float xhalf = 0.5f * x;
  int i = Float.floatToIntBits(x);
  i = 0x5f3759df - (i >> 1);
  x = Float.intBitsToFloat(i);
  x *= (1.5f - xhalf * x * x);
  return x;
}