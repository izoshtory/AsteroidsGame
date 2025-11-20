Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;
boolean gameWon = false;

void setup() {
    size(600, 600);
    
    ship = new Spaceship();
    
    stars = new Star[200];
    for(int i = 0; i < stars.length; i++) {
        stars[i] = new Star();
    }
    
    asteroids = new ArrayList<Asteroid>();
    for(int i = 0; i < 10; i++) {
        asteroids.add(new Asteroid());
    }
}

void draw() {
    background(0);
    
    // Draw stars
    for(int i = 0; i < stars.length; i++) {
        stars[i].show();
    }
    
    // Move and show spaceship
    ship.move();
    ship.show();
    
    // Process asteroids (iterate backwards for safe removal)
    for(int i = asteroids.size() - 1; i >= 0; i--) {
        Asteroid ast = asteroids.get(i);
        
        // Check collision
        float distance = dist((float)ship.getCenterX(), (float)ship.getCenterY(), 
                            (float)ast.getCenterX(), (float)ast.getCenterY());
        
        if(distance < 20) {
            asteroids.remove(i);
        } else {
            ast.move();
            ast.show();
        }
    }
    
    // Display asteroid count
    fill(0, 255, 0);
    textSize(16);
    textAlign(LEFT);
    text("Asteroids: " + asteroids.size(), 10, 20);
    
    // Win condition
    if(asteroids.size() == 0 && !gameWon) {
        gameWon = true;
    }
    
    if(gameWon) {
        fill(0, 255, 0);
        textSize(48);
        textAlign(CENTER);
        text("YOU WIN!", width/2, height/2);
        textSize(24);
        text("Press R to Restart", width/2, height/2 + 40);
    }
}

void keyPressed() {
    if(key == 'a' || key == 'A' || keyCode == LEFT) {
        ship.turn(-10);
    }
    else if(key == 'd' || key == 'D' || keyCode == RIGHT) {
        ship.turn(10);
    }
    else if(key == 'w' || key == 'W' || keyCode == UP) {
        ship.accelerate(0.1);
    }
    else if(key == 'h' || key == 'H') {
        ship.hyperspace();
    }
    else if(key == 'r' || key == 'R') {
        // Restart game
        setup();
        gameWon = false;
    }
}
