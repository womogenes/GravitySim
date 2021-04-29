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
float dt; // Timestep

/* GRAHPICS */
PShape circle;

// Camera stuff
float camx, camy, tox, toy;
float zoom, tozoom;
float dzoom = 0.5; // Change in zoom amount
float xOffset, yOffset;

// Interface stuff
int everyInsert; // One particle inserted every this many frames
Vector insertStart;

/* VARIABLES */
ArrayList<Particle> particles;
TreeNode root;

void setup() {
  // Config
  N = 1;
  r = 2;
  mass = 1;
  G = 0.01; // Gravitational constant
  theta = 0.7; // Constant used for Barnes-Hut
  restitution = 0.9;
  initBounds = width / 2;
  initVel = 0.1;
  dt = 1;

  // Graphics
  size(800, 800, P2D);
  frameRate(240);
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

  // Interface
  everyInsert = 30;
  insertStart = null;

  // Variables
  particles = new ArrayList(3000);
  for (int i = 0; i < N; i++) {
    particles.add(
      new Particle(
        new Vector(random(-initBounds, initBounds), random(-initBounds, initBounds)),
        new Vector(random(-initVel, initVel), random(-initVel, initVel))
      )
    );
  }
}