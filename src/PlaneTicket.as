package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import gmenu.Mediator;
	
	/**
	 * The plane ticket
	 * End level 1
	 * 
	 * @author AKM
	 */
	public class PlaneTicket extends Entity
	{
		private var mediator:Mediator;
		public function PlaneTicket()
		{
			mediator = new Mediator();
			graphic = new Image(Assets.PLANE_TICKET);
			setHitbox(120, 63);
			type="planeticket"; 
		}
		
		public function destroy():void
		{
			mediator.level2Complete = true
			mediator.reachDestination = true;
			mediator.theHP = 100;
			FP.world.remove(this);
			mediator.playMusic = false;
		}
		

	}
	
}