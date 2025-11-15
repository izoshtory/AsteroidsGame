Spaceship ship;
Star[] stars;

void setup() {
    size(600, 600);
    
    // Create the spaceship
    ship = new Spaceship();
    
    // Create 200 stars for the background
    stars = new Star[200];
    for(int i = 0; i < stars.length; i++) {
        stars[i] = new Star();
    }
}

void draw() {
    background(0);
    
    // Draw all the stars
    for(int i = 0; i < stars.length; i++) {
        stars[i].show();
    }
    
    // Move and show the spaceship
    ship.move();
    ship.show();
}

void keyPressed() {
    // Turn left
    if(key == 'a' || key == 'A' || keyCode == LEFT) {
        ship.turn(-10);
    }
    // Turn right
    else if(key == 'd' || key == 'D' || keyCode == RIGHT) {
        ship.turn(10);
    }
    // Accelerate
    else if(key == 'w' || key == 'W' || keyCode == UP) {
        ship.accelerate(0.1);
    }
    // Hyperspace
    else if(key == 'h' || key == 'H') {
        ship.hyperspace();
    }
}
