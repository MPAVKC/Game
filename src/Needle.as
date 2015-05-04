package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import gmenu.Mediator;
	
	/**
	 * ...
	 * @author AKM
	 */
	public class Needle extends Entity
	{
		private var mediator:Mediator;
		public function Needle()
		{
			mediator = new Mediator();
			graphic = new Image(Assets.NEEDLE);
			
			setHitbox(50, 50);
			
			type="needle"; 
		}
		
		public function destroy():void
		{
			mediator.theHP = -8;
			FP.world.remove(this);
		}

	}
	
}