package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * A cloud 
	 * 
	 * @author AKM
	 */
	public class Cloud extends Entity
	{		
		public function Cloud() 
		{
			graphic =  new Image(Assets.CLOUD);
			setHitbox(100, 60);
			type = "cloud";
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}
}