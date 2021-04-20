void insertSquare(Vector center, float width) {
  Vector vel = new Vector((mouseX - pmouseX) / zoom, (mouseY - pmouseY) / zoom);
  vel.mult(0.1);
  for (float x = center.x - width / 2; x < center.x + width / 2; x += 2 * r) {
    for (float y = center.y - width / 2; y < center.y + width / 2; y += 2 * r) {
      particles.add(
        new Particle(
          new Vector(x, y),
          vel.copy()
        )
      );
      N++;
    }
  }
}

Vector screenToSpace(float x, float y) {
  return new Vector((x - camx) / zoom, (y - camy) / zoom);
}