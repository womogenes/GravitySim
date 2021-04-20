void mouseDragged() {
  if (mouseButton == RIGHT) { updateCam(); return; }
};

void mousePressed() {
  if (mouseButton == RIGHT) { setCamOffsets(); return; }
};

void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  if (e < 0) {
    tox -= dzoom * (mouseX - tox);
    toy -= dzoom * (mouseY - toy);
    tozoom *= dzoom + 1;

  } else {
    tox += dzoom / (dzoom + 1) * (mouseX - tox); 
    toy += dzoom / (dzoom + 1) * (mouseY - toy);
    tozoom /= dzoom + 1;
  }
};

void inputLoop() {
  if (mousePressed) {
    if (mouseButton == LEFT && frameCount % everyInsert == 0) {
      insertSquare(screenToSpace(mouseX, mouseY), 20f);
    }
  }
}

void createParticle(Vector pos, Vector vel) {
  Particle newP = new Particle(pos, new Vector(0, 0));
  newP.vel = vel;
  particles.add(newP);
  N++;
}

void updateCam() {
  tox = (mouseX - xOffset);
  toy = (mouseY - yOffset);
}

void setCamOffsets() {
  xOffset = mouseX - camx;
  yOffset = mouseY - camy;
}