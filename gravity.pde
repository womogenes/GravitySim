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
    a.nextVel = a.vel.copy();
    for (Particle b : particles) {
      if (a == b) continue;
      Vector acc = gravityAcc(b.pos, a.pos, mass);

      a.nextVel.add(acc);
    }
  }

  for (Particle p : particles) {
    p.vel = p.nextVel;
  }
}

// Acceleration due to the gravity exerted by a on b
Vector gravityAcc(Vector a, Vector b, float m_b) {
  return mult(sub(a, b), dt * G * m_b / (distSquared(a, b) * (float) Math.sqrt(dist(a, b))));
  //return mult(sub(a, b), dt * G * m_b / (distSquared(a, b)));
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