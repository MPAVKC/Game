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
	 * A train for transporting the player to the train station
	 * 
	 * @author 	AKM
	 */
	
	public class Train extends Entity
	{
		private var mediator:Mediator;
		
		private var train:Spritemap;
		
		// when the train ha arrived to the train station
		public var hasArrived:Boolean = false;
		
		//to let the train know when to start moving
		public var startMoving:Boolean = false;
		
		// how fast the train will move
		protected var speed:Number = 150.0;
		
		public function Train(xLoc:Number, yLoc:Number) 
		{	
			// plane's location on screen
			x = xLoc;
			y = yLoc;
			
			mediator = new Mediator();

			train = new Spritemap(Assets.TRAIN, 350, 120);
			
			graphic = train;
		}
		
		override public function update():void 
		{
			
			var x_location:Number = x;
			
			if (startMoving) {
				
				if (x_location < 3700) {
					x_location += speed * FP.elapsed;
				}else {
					startMoving = false;
					hasArrived = true;
					
				}
			}
			
			
			x = x_location; 
			
			super.update();
		}
		
	}

}