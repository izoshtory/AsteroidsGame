class Bullet extends Floater {
    private int timer;  // Bullet lifespan
    
    // Constructor takes Spaceship as argument
    public Bullet(Spaceship theShip) {
        // Initialize bullet at ship's position and direction
        myCenterX = theShip.getCenterX();
        myCenterY = theShip.getCenterY();
        myXspeed = theShip.getXspeed();
        myYspeed = theShip.getYspeed();
        myPointDirection = theShip.getPointDirection();
        
        // Accelerate bullet forward
        accelerate(6.0);
        
        // Set bullet color
        myColor = color(255, 255, 0);  // Yellow
        
        // Initialize timer (bullet will exist for 60 frames = ~1 second)
        timer = 60;
    }
    
    // Override show() to draw circular bullet
    public void show() {
        fill(myColor);
        noStroke();
        ellipse((float)myCenterX, (float)myCenterY, 5, 5);  // Draw as circle
    }
    
    // Override move() to decrease timer
    public void move() {
        super.move();
        timer--;
    }
    
    // Check if bullet should be removed
    public boolean shouldRemove() {
        return timer <= 0;
    }
    
    // Getter methods for collision detection
    public double getCenterX() {
        return myCenterX;
    }
    
    public double getCenterY() {
        return myCenterY;
    }
}
