// Collisions
void collide() {
  for (Particle p : particles) { collide(p, root); }
}

void collide(Particle p, TreeNode tn) {
  // Collide with a particle
  if (tn.leaf) {
    if (tn.particle == null || p == tn.particle) return;

    float dist = dist(p.pos, tn.particle.pos);
    collide(p, tn.particle, dist);
    return;
  }

  // Find which quadrant to collide with
  for (TreeNode child : tn.children) {
    boolean outside = p.pos.x + 2 * r < child.x || p.pos.x - 2 * r > child.x + child.w
                   || p.pos.y + 2 * r < child.y || p.pos.y - 2 * r > child.y + child.w;
    if (!outside) { collide(p, child); }
  }
}

void collide(Particle a, Particle b, float dist) {
  if (dist >= 1.9 * r) return;

  a.heat += 0.01;
  b.heat += 0.01;

  Vector dPos = sub(a.pos, b.pos);
  dPos.normalize();

  Vector mtd = mult(dPos, r - dist / 2);
  a.nextPos.add(mtd);
  //b.nextPos.sub(mtd);

  float impactSpeed = dot(sub(a.vel, b.vel), dPos);

  if (impactSpeed > 0) return;

  Vector force = mult(dPos, impactSpeed * restitution);
  a.nextVel.sub(force);
  //b.nextVel.add(force);
}