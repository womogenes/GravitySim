// Collisions
void collide() {
  for (Particle p : particles) {
    p.nextPos = p.pos.copy();
    p.nextVel = p.vel.copy();
  }
  for (Particle p : particles) { collide(p, root); }

  for (Particle p : particles) {
    p.pos = p.nextPos;
    p.vel = p.nextVel;
  }
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

  // Push-pull them apart
  Vector mtd = mult(dPos, r - dist / 2);
  a.nextPos.add(mtd);

  float impactSpeed = dot(sub(a.vel, b.vel), dPos);
  a.heat += abs(impactSpeed) * 0.1;

  // If already moving away from each other, return
  if (impactSpeed > 0) { return; }

  Vector force = mult(dPos, impactSpeed * (1 + restitution) * 0.5);
  a.nextVel.sub(force);
}