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
  if (dist > 2 * r) return;

  Vector dPos = sub(a.pos, b.pos);
  dPos.normalize();

  Vector mtd = mult(dPos, r - dist / 2);
  a.pos.add(mtd);
  b.pos.sub(mtd);

  float impactSpeed = dot(sub(a.vel, b.vel), dPos);

  a.heat += abs(impactSpeed) * 0.1;
  b.heat += abs(impactSpeed) * 0.1;

  Vector force = mult(dPos, impactSpeed * restitution);
  a.vel.sub(force);
  b.vel.add(force);
}