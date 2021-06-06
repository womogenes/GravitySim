// Gravity algorithm
// Blank for now
void gravity() {
  for (Particle p : particles) {
    gravitate(p, root);
  }
}

// Naive
void _gravity() {
  for (Particle a : particles) {
    for (Particle b : particles) {
      a.vel.sub(gravityAcc(a.pos, b.pos, mass));
      b.vel.sub(gravityAcc(b.pos, a.pos, mass));
    }
  }
}

Vector gravityAcc(Vector a, Vector b, float m_b) {
  if (a.equals(b)) return new Vector(0, 0);
  return mult(sub(a, b), G * m_b / (distSquared(a, b) * (float) Math.sqrt(distSquared(a, b) + 1)) * dt);
  //return mult(sub(a, b), G * m_b / (distSquared(a, b)));
}

void gravitate(Particle p, TreeNode tn) {
  if (tn.leaf) {
    if (tn.particle == null || p == tn.particle) return;
    p.vel.add(gravityAcc(tn.particle.pos, p.pos, mass));
    return;
  }

  if (tn.center == null) { tn.center = mult(tn.totalCenter, 1.0f / tn.count); }
  if (tn.w / dist(p.pos, tn.center) < theta) {
    p.vel.add(gravityAcc(tn.center, p.pos, tn.totalMass));
    return;
  }

  for (TreeNode child : tn.children) gravitate(p, child);
}