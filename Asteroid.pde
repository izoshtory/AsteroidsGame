class Asteroid extends Floater {
    private double rotSpeed;
    
    public Asteroid() {
        rotSpeed = (Math.random() * 4) - 2;
        corners = 8;
        xCorners = new int[] {-10, -5, 5, 10, 8, 5, -5, -8};
        yCorners = new int[] {-8, -10, -8, -5, 5, 10, 8, 5};
        
        int grayShade = (int)(Math.random() * 100) + 100;
        myColor = color(grayShade);
        
        myCenterX = Math.random() * width;
        myCenterY = Math.random() * height;
        myXspeed = (Math.random() * 2) - 1;
        myYspeed = (Math.random() * 2) - 1;
        myPointDirection = Math.random() * 360;
    }
    
    public void show() {
        fill(myColor);
        stroke(200);
        strokeWeight(1);
        
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
    
    public void move() {
        turn((int)rotSpeed);
        super.move();
    }
    
    public double getCenterX() {
        return myCenterX;
    }
    
    public double getCenterY() {
        return myCenterY;
    }
}
