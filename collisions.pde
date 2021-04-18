// Collisions
void collide() {
  // Naive for now
  for (Particle i : particles) { 
    for (Particle j : particles) {
      if (i == j) continue;

      float dist = dist(i.pos, j.pos);
      if (dist <= 2 * r) {
        collide(i, j, dist);
      }
    }
  }
}

void collide(Particle a, Particle b, float dist) {
  Vector dPos = sub(a.pos, b.pos);
  dPos.normalize();

  Vector mtd = mult(dPos, r - dist / 2);
  a.pos.add(mtd);
  b.pos.sub(mtd);

  Vector force = mult(dPos, dot(sub(a.vel, b.vel), dPos) * restitution);
  a.vel.sub(force);
  b.vel.add(force);
}