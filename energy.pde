float totalKineticEnergy() {
  float total = 0;
  for (Particle p : particles) { total += kineticEnergy(p); }
  return total;
}

float kineticEnergy(Particle p) {
  return 0.5 * mass * p.vel.magSquared();
}

Vector totalMomentum() {
  Vector total = new Vector(0, 0);
  for (Particle p : particles) { total.add(momentum(p)); }
  return total;
}

Vector momentum(Particle p) {
  return mult(p.vel, mass);
}