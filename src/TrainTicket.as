package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import gmenu.Mediator;
	
	/**
	 * The train ticket
	 * End level 1
	 * 
	 * @author AKM
	 */
	public class TrainTicket extends Entity
	{
		private var mediator:Mediator;
		public function TrainTicket()
		{
			mediator = new Mediator();
			graphic = new Image(Assets.TRAIN_TICKET);
			setHitbox(120, 63);
			type="ticket"; 
		}
		
		public function destroy():void
		{
			mediator.level1Complete = true
			mediator.reachDestination = true;
			mediator.theHP = 100;
			FP.world.remove(this);
			mediator.playMusic = false;
		}
		

	}
	
}