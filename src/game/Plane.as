package  game
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import gmenu.Mediator;
	
	/**
	 * A plane from transportig the player to 
	 * another part of the game
	* 
	* @author 	AMK
	* 
	*/
	
	public class Plane extends Entity
	{
		private var mediator:Mediator;
		
		private var plane:Spritemap;
		
		public var hasLanded:Boolean = false;
		
		// how fast the plane should move down
		private static const gravity:Number = -35.0;
		
		// how fast theplane moves
		protected var speed:Number = 125.0;
		
		public function Plane(xLoc:Number, yLoc:Number) 
		{	
			// plane's location on screen
			x = xLoc;
			y = yLoc;
			
			mediator = new Mediator();

			plane = new Spritemap(Assets.PLANE, 210, 110);
			plane.add("takeoff", [2], 5,  true);
			plane.add("normal", [3], 5,  true);
			plane.add("landing1", [4], 5,  true);
			plane.add("landing2", [5], 5,  true);
			
			graphic = plane;
			setHitbox(200, 100, 10, 30);
			type = "plane"; 
		}
		
		override public function update():void 
		{
			
			var xPos:Number = x;
			var yPos:Number = y;
			
			if (xPos < 1000) {
				plane.play("takeoff");
				xPos += speed * FP.elapsed;
				yPos += gravity * FP.elapsed;
				y = Math.min(FP.stage.height - height, Math.max(75, yPos));
			}
			else if ( ( xPos > 1000) &&  xPos <= 5400) {
				plane.play("normal");
				xPos += speed * FP.elapsed;
				yPos += gravity * FP.elapsed;
				y = Math.min(FP.stage.height - height, Math.max(75, yPos));
			}
			else if (( xPos > 5400) &&  xPos <= 6350) {
				xPos += speed * FP.elapsed;
				plane.play("landing1");
				yPos -= speed * FP.elapsed;
				y -= gravity * FP.elapsed ;
				
			}
			else if (( xPos > 6350) &&  xPos <= 7000) {
				xPos += speed * FP.elapsed;
				plane.play("landing2");
				
				if( y < 410 ){
				y -= gravity * FP.elapsed ;
				}else {
					y = 410;
				}
			}
			else {
				hasLanded = true;
			}
			
			// Input checking
			if (Input.check(Key.UP))
			{
				// move up
				if (x > 500 && x < 5400){
				yPos -= speed * FP.elapsed;
				y = Math.min(FP.stage.height - height, Math.max(75, yPos));
				
				}
				
			} else if (Input.check(Key.DOWN))
			{
				if( y < 390 && x < 5700){
				yPos += speed * FP.elapsed;
				y = Math.min(FP.stage.height - height, Math.max(75, yPos));
				}
			
			}
			
			x = xPos; 
			
			var coin:Coins = collide("coin", x, y) as Coins;
			var cloud:Cloud = collide("cloud", x, y) as Cloud;
			
			if (coin)
			{
				mediator.thecoinsnum = 1;
				coin.destroy();
			}
			
			if (cloud)
			{
				mediator.theHP = -5;
				cloud.destroy();
			}
			
			super.update();
		}
		
	}

}