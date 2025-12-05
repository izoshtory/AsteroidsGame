class Star {
    private int myX, myY;
    private int mySize;
    private int myBrightness;
    
    public Star() {
        myX = (int)(Math.random() * width);
        myY = (int)(Math.random() * height);
        mySize = (int)(Math.random() * 2) + 1;
        myBrightness = (int)(Math.random() * 156) + 100;
    }
    
    public void show() {
        noStroke();
        fill(myBrightness);
        ellipse(myX, myY, mySize, mySize);
    }
}
