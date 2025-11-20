class Spaceship extends Floater {
    Spaceship() {
        corners = 4;
        xCorners = new int[] {-8, 16, -8, -2};
        yCorners = new int[] {-8, 0, 8, 0};
        myColor = color(0, 255, 0);
        myCenterX = width / 2.0;
        myCenterY = height / 2.0;
        myXspeed = 0;
        myYspeed = 0;
        myPointDirection = 0;
    }
    
    void show() {
        fill(myColor);
        stroke(myColor);
        strokeWeight(2);
        
        pushMatrix();
        translate((float)myCenterX, (float)myCenterY);
        rotate(radians((float)myPointDirection));
        
        beginShape();
        for(int i = 0; i < corners; i++) {
            vertex(xCorners[i], yCorners[i]);
        }
        endShape(CLOSE);
        
        popMatrix();
    }
    
    void hyperspace() {
        myXspeed = 0;
        myYspeed = 0;
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        myPointDirection = Math.random() * 360;
    }
    
    // Getter methods for collision detection
    double getCenterX() {
        return myCenterX;
    }
    
    double getCenterY() {
        return myCenterY;
    }
}
