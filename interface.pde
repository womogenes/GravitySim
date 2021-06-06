void insertSquare(Vector center, float size, Vector vel) {
  for (float x = center.x - size / 2; x < center.x + size / 2; x += 2 * r) {
    for (float y = center.y - size / 2; y < center.y + size / 2; y += 2 * r) {
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

void insertSquare() {
  insertSquare(
    insertStart,
    0.1,
    mult(sub(screenToSpace(mouseX, mouseY), insertStart), 0.01)
  );
  insertStart = null;
}

Vector screenToSpace(float x, float y) {
  return new Vector((x - camx) / zoom, (y - camy) / zoom);
}

void updateCam() {
  tox = (mouseX - xOffset);
  toy = (mouseY - yOffset);
}

void setCamOffsets() {
  xOffset = mouseX - camx;
  yOffset = mouseY - camy;
}

void setInsertStart() {
  insertStart = screenToSpace(mouseX, mouseY);
}