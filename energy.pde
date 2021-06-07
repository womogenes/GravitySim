float totalKineticEnergy() {
  float total = 0;
  for (Particle p : particles) { total += twiceKineticEnergy(p); }
  return 2 * total;
}

float twiceKineticEnergy(Particle p) {
  return mass * p.vel.magSquared();
}

Vector totalMomentum() {
  Vector total = new Vector(0, 0);
  for (Particle p : particles) { total.add(momentum(p)); }
  return total;
}

Vector momentum(Particle p) {
  return mult(p.vel, mass);
}