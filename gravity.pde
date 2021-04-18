// Gravity algorithm
// Naive

void gravity() {
  for (int i = 0; i < N; i++) {
    for (int j = i + 1; j < N; j++) {
      if (i == j) continue;

      Particle a = particles[i];
      Particle b = particles[j];

      float dist = distSquared(a.pos, b.pos);
      Vector force = sub(a.pos, b.pos);
      force.mult(G / dist);

      a.vel.sub(force);
      b.vel.add(force);
    }
  }
}