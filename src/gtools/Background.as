package gtools 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.*;
	
	/**
	 * Background for screens
	 * @author AKM
	 */
	public class Background extends Entity
	{
		
		public function Background(source:*)
		{
			graphic = new Image(source);
		}
		
	}
}