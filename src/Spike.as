package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * The spikes
	 * 
	 * @author AKM
	 */
	public class Spike extends Entity
	{		
		
		public function Spike() 
		{
			graphic = new Image(Assets.SPIKE);
			setHitbox(32, 16);
			type = "spike";
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
		
	}

}