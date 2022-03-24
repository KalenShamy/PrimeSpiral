int stepsToTurn = 1;
int sameSteps = 0;
int sinceTurn = 0;
int px;
int py;
int lpx;
int lpy;
int step = 10; // change density
int dx = step;
int dy = 0;
int end;

void setup() {
  size(500, 500); // change output size
  background(100,150,255);
  px = width/2;
  py = height/2;
  lpx = px;
  lpy = py;
  end = ((width/step)-1)*((height/step)-1);
  
  for (int i = 1; i <= end; i++) {
    strokeWeight(step/10);
    stroke(255,255,255,75);
    line(px, py, lpx, lpy);
    if (isPrime(i-1) && i > 1) {
      stroke(255);
      strokeCap(ROUND);
      strokeWeight(step/2);
      point(lpx,lpy);
    }
    lpx = px;
    lpy = py;
    px += dx;
    py += dy;
    sinceTurn++;
    if (stepsToTurn == sinceTurn) {
      turn();
      sinceTurn = 0;
      sameSteps++;
    }
    if (sameSteps == 2) {
      sameSteps = 0;
      stepsToTurn++;
    }
  }
  
  // uncomment if you want to save the result
  // save("primeSpiral.png");
}

boolean isPrime(float num) {
  boolean prime = true;
  for (int i = 2; i <= sqrt(num); i++) {
    if (num % i == 0) prime = false;
  }
  return prime && num > 1;
}

boolean notPrime(float num) {
  boolean prime = true;
  for (int i = 2; i <= sqrt(num); i++) {
    if (num % i == 0) prime = false;
  }
  return !(prime && num > 1);
}

boolean perfectSqr(int num) {
  return sq(floor(sqrt(num))) == num;
}

boolean eulersPrimePoly(float num) {
  float lastSeenNum = 0;
  int numsSeen = 0;
  while (lastSeenNum < num) {
    numsSeen++;
    if (isPrime(sq(numsSeen)-numsSeen+41)) {
      lastSeenNum = sq(numsSeen)-numsSeen+41;
    }
  }
  return lastSeenNum == num;
}

boolean eulersPrimePolyOutliers(float num) {
  float lastSeenNum = 0;
  int numsSeen = 0;
  while (lastSeenNum < num) {
    numsSeen++;
    if (!isPrime(sq(numsSeen)-numsSeen+41)) {
      lastSeenNum = sq(numsSeen)-numsSeen+41;
    }
  }
  return lastSeenNum == num;
}

boolean divisibleBy(float num, float denominator) {
  return (num/denominator)%1 == 0;
}

void turn() {
  if (dx == step) {
    dx = 0;
    dy = -step;
  } else if (dy == -step) {
    dx = -step;
    dy = 0;
  } else if (dx == -step) {
    dx = 0;
    dy = step;
  } else if (dy == step) {
    dx = step;
    dy = 0;
  }
}
