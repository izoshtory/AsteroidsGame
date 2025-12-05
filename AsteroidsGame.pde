Spaceship ship;
Star[] stars;
ArrayList<Asteroid> asteroids;
ArrayList<Bullet> bullets;  // NEW: ArrayList for bullets
boolean gameWon = false;
int score = 0;

void setup() {
    frameRate(60);
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
    
    bullets = new ArrayList<Bullet>();  // NEW: Initialize bullets ArrayList
}

void draw() {
    if(gameWon == false){
      score += 1;
    }
    background(0);
    
    // Draw stars
    for(int i = 0; i < stars.length; i++) {
        stars[i].show();
    }
    
    // Move and show spaceship
    ship.move();
    ship.show();
    
    // NEW: Move and show all bullets
    for(int i = bullets.size() - 1; i >= 0; i--) {
        Bullet b = bullets.get(i);
        b.move();
        b.show();
        
        // Remove bullet if it goes off screen or times out
        if(b.shouldRemove()) {
            bullets.remove(i);
        }
    }
    
    // NEW: Check bullet-asteroid collisions
    for(int i = bullets.size() - 1; i >= 0; i--) {
        for(int j = asteroids.size() - 1; j >= 0; j--) {
            Bullet b = bullets.get(i);
            Asteroid ast = asteroids.get(j);
            
            // Check collision between bullet and asteroid
            float distance = dist((float)b.getCenterX(), (float)b.getCenterY(),
                                (float)ast.getCenterX(), (float)ast.getCenterY());
            
            if(distance < 20) {  // Collision detected!
                asteroids.remove(j);  // Remove asteroid
                bullets.remove(i);    // Remove bullet
                break;  // Exit inner loop to prevent index errors
            }
        }
    }
    
    // Process asteroids (iterate backwards for safe removal)
    for(int i = asteroids.size() - 1; i >= 0; i--) {
        Asteroid ast = asteroids.get(i);
        
        // Check ship-asteroid collision
        float distance = dist((float)ship.getCenterX(), (float)ship.getCenterY(), 
                            (float)ast.getCenterX(), (float)ast.getCenterY());
        
        if(distance < 20) {
            asteroids.remove(i);
        } else {
            ast.move();
            ast.show();
        }
    }
    
    // Display game info
    fill(0, 255, 0);
    textSize(16);
    textAlign(LEFT);
    text("Asteroids: " + asteroids.size(), 10, 20);
    text("Bullets: " + bullets.size(), 10, 40);  // NEW: Show bullet count
    
    // Win condition
    if(asteroids.size() == 0 && !gameWon) {
        gameWon = true;
    }
    
    if(gameWon) {
        int realscore = 10000-score;
        fill(0, 255, 0);
        textSize(48);
        textAlign(CENTER);
        text(("YOU WIN! Score: " + realscore), width/2, height/2);
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
    else if(key == ' ') {  // NEW: Shoot bullet with SPACE
        bullets.add(new Bullet(ship));
    }
    else if(key == 'r' || key == 'R') {
        // Restart game
        setup();
        gameWon = false;
    }
}
