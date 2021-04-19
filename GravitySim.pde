import java.util.ArrayList;

/* CONFIG */
int N; // Number of particles
float r; // Radius
float mass;
float G;
float theta;
float restitution;
float initBounds;
float initVel;

/* GRAHPICS */
PShape circle;

// Camera stuff
float camx, camy, tox, toy;
float zoom, tozoom;
float dzoom = 0.5; // Change in zoom amount
float xOffset, yOffset;

/* VARIABLES */
ArrayList<Particle> particles;
TreeNode root;

void setup() {
  // Config
  N = 2000;
  r = 2;
  mass = 1;
  G = 0.01; // Gravitational constant
  theta = 0.7; // Constant used for Barnes-Hut
  restitution = 0.9;
  initBounds = width / 2;
  initVel = 0.1;

  // Graphics
  size(800, 800, P2D);
  frameRate(120);
  noFill();
  stroke(255);
  strokeWeight(2 * r); //noStroke();
  textAlign(RIGHT, BOTTOM);
  textSize(24);

  circle = createShape(ELLIPSE, 0, 0, 2 * r, 2 * r);

  // Camera
  tox = width / 2;
  toy = height / 2;
  camx = width / 2;
  camy = height / 2;
  zoom = 1;
  tozoom = 1;
  xOffset = 0;
  yOffset = 0;

  // Variables
  particles = new ArrayList(N * 2);
  for (int i = 0; i < N; i++) {
    Particle newP = new Particle(new Vector(random(-initBounds, initBounds), random(-initBounds, initBounds)));
    newP.vel.x = random(-initVel, initVel);
    newP.vel.y = random(-initVel, initVel);
    particles.add(newP);
  }
}