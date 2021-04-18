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