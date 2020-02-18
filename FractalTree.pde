private double fractionLength = .8; 
private double smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke((int)(Math.random()*155+100),(int)(Math.random()*155+100),(int)(Math.random()*155+100));   
	line(320,480,320,380);   
	drawBranches(320,380,55,3*Math.PI/2);  //will add later 
	drawBranches(150,500,45,3*Math.PI/2);
	drawBranches(500,500,45,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here 
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	branchAngle = branchAngle*fractionLength;
	//branchLength = branchLength*fractionLength;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x,y,endX1,endY1);
	line(x,y,endX2,endY2);
	if (branchLength>smallestBranch)
	{
		stroke((int)(Math.random()*155+100),(int)(Math.random()*155+100),(int)(Math.random()*155+100));   
		drawBranches(endX1,endY1,branchLength-5,angle1+50);
		drawBranches(endX2,endY2,branchLength-5,angle2-50);
		//drawBranches(endX1,endY1,branchLength,angle1);
		//drawBranches(endX2,endY2,branchLength,angle2);
	}

} 

public void mousePressed()
{
	redraw();
}
