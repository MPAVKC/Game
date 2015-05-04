package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;

	/**
	 * The coins
	 * 
	 * @author AKM
	 */
	public class Coins extends Entity
	{
		public var coin:Spritemap;
		
		public function Coins()
		{
			coin = new Spritemap(Assets.COIN, 30, 33);
			coin.add("spin", [0, 1, 2, 3], 5,  true);
			coin.play("spin", true);
			graphic = coin;
			
			setHitbox(30, 33);
			type = "coin"; 
		}
		
		public function destroy():void
		{
			
			FP.world.remove(this);
		}

	}
	
}