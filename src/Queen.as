package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import gmenu.Mediator;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * The Queen.
	 * Ends level 3
	 * @author AKM
	 */
	public class Queen extends Entity
	{
		private var mediator:Mediator;
		public var queen:Spritemap;
		public function Queen()
		{
			mediator = new Mediator();
			queen = new Spritemap(Assets.QUEEN, 52, 93);
			queen.add("queen", [0, 1, 2], 5,  true);
			queen.play("queen", true);
			graphic = queen;
			
			setHitbox(35, 40);
			type = "queen"; 
		}
		
		public function destroy():void
		{
			mediator.level3Complete = true
			mediator.reachDestination = true;
			mediator.theHP = 100;
			FP.world.remove(this);
			mediator.playMusic = false;
		}

	}
	
}