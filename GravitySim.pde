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
  N = 2000;
  r = 2;
  mass = 1;
  G = 1; // Gravitational constant
  theta = 0.7; // Constant used for Barnes-Hut
  restitution = 0.2;
  initBounds = width / 4;
  initVel = 20;
  dt = 1;

  // Graphics
  size(800, 800, P2D);
  frameRate(240);
  colorMode(HSB, 255);
  noFill();
  stroke(255);
  strokeWeight(2 * r); //noStroke();
  textAlign(LEFT, BOTTOM);
  textSize(24);

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
    float angle = random(0, TWO_PI);
    float dist = random(0, initBounds);

    Vector pos = new Vector(
      dist * cos(angle),
      dist * sin(angle)
    );

    float mag = dist * 0.02;
    Vector vel = new Vector(
      mag * cos(angle + PI / 2),
      mag * sin(angle + PI / 2)
    );

    particles.add(new Particle(pos, vel));
  }

  /* for (int i = 0; i < 100; i++) {
    particles.add(new Particle(0, 0));
  } */
}
