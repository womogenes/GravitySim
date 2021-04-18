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
/*
float invsqrt(float number) {
  float x = number;
  float xhalf = 0.5f * x;
  long i = Float.floatToLongBits(x);
  i = 0x5fe6ec85e7de30daL - (i >> 1);
  x = Float.longBitsTofloat(i);
  for (int it = 0; it < 4; it++){
    x = x * (1.5d - xhalf * x * x);
  }
  x *= number;
  return x;
}
*/