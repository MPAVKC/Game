package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * The crystals
	 * 
	 * @author AKM
	 */
	public class Crystal extends Entity
	{
		public var crystal:Spritemap;
		
		public function Crystal()
		{
			crystal = new Spritemap(Assets.CRYSTAL, 32, 32);
			crystal.add("spin", [0, 1, 2, 3, 4, 5], 5,  true);
			crystal.play("spin", true);
			graphic = crystal;
			
			setHitbox(20, 20);
			type = "crystal"; 
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}

	}
	
}