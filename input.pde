void mouseDragged() {
  tox = (mouseX - xOffset);
  toy = (mouseY - yOffset);
};

void mousePressed() {
  xOffset = mouseX - camx;
  yOffset = mouseY - camy;
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