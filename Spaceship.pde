class Spaceship extends Floater {
    public Spaceship() {
        // Set the number of corners
        corners = 4;
        
        // Define the shape (centered at 0,0 and pointing right)
        xCorners = new int[] {-8, 16, -8, -2};
        yCorners = new int[] {-8, 0, 8, 0};
        
        // Set color (green)
        myColor = color(0, 255, 0);
        
        // Set starting position (center of screen)
        myCenterX = width / 2;
        myCenterY = height / 2;
        
        // Start with no velocity
        myXspeed = 0;
        myYspeed = 0;
        
        // Point to the right initially
        myPointDirection = 0;
    }
    
    public void show() {
        fill(myColor);
        stroke(myColor);
        strokeWeight(2);
        
        // Translate and rotate
        pushMatrix();
        translate((float)myCenterX, (float)myCenterY);
        rotate(radians((float)myPointDirection));
        
        // Draw the spaceship
        beginShape();
        for(int i = 0; i < corners; i++) {
            vertex(xCorners[i], yCorners[i]);
        }
        endShape(CLOSE);
        
        popMatrix();
    }
    
    public void hyperspace() {
        // Stop the ship
        myXspeed = 0;
        myYspeed = 0;
        
        // Random new position
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        
        // Random new direction
        myPointDirection = Math.random() * 360;
    }
}
