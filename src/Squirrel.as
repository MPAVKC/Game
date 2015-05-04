package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import gmenu.Mediator;
	
	/**
	 * The squirrel
	 * @author AKM
	 */
	public class Squirrel extends Entity
	{
		private var mediator:Mediator;
		public function Squirrel()
		{
			mediator = new Mediator();
			graphic = new Image(Assets.SQUIRREL);
			
			setHitbox(74, 65);
			
			type="squirrel"; 
		}
		
		public function destroy():void
		{
			mediator.theHP = -5;
			FP.world.remove(this);
		}

	}
	
}