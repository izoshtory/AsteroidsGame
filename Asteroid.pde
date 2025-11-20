class Asteroid extends Floater {
    private double rotSpeed; // Speed of rotation
    
    public Asteroid() {
        // Set random rotation speed (positive or negative)
        rotSpeed = (Math.random() * 4) - 2; // Range: -2 to 2
        
        // Set the number of corners for irregular asteroid shape
        corners = 8;
        
        // Create irregular asteroid shape
        xCorners = new int[] {-10, -5, 5, 10, 8, 5, -5, -8};
        yCorners = new int[] {-8, -10, -8, -5, 5, 10, 8, 5};
        
        // Random color (gray shades)
        int grayShade = (int)(Math.random() * 100) + 100;
        myColor = color(grayShade);
        
        // Random starting position
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        
        // Random velocity
        myXspeed = (Math.random() * 2) - 1; // Range: -1 to 1
        myYspeed = (Math.random() * 2) - 1; // Range: -1 to 1
        
        // Random starting direction
        myPointDirection = Math.random() * 360;
    }
    
    public void show() {
        fill(myColor);
        stroke(200);
        strokeWeight(1);
        
        // Translate and rotate
        pushMatrix();
        translate((float)myCenterX, (float)myCenterY);
        rotate(radians((float)myPointDirection));
        
        // Draw the asteroid
        beginShape();
        for(int i = 0; i < corners; i++) {
            vertex(xCorners[i], yCorners[i]);
        }
        endShape(CLOSE);
        
        popMatrix();
    }
    
    // Override move() to include rotation
    public void move() {
        // Rotate the asteroid
        turn((int)rotSpeed);
        
        // Call parent's move method
        super.move();
    }
    
    // Getter methods for collision detection
    public double getCenterX() {
        return myCenterX;
    }
    
    public double getCenterY() {
        return myCenterY;
    }
}
