package gmenu 
{
	import Assets;
	import gtools.Background;
	import net.flashpunk.FP;
	import gButtons.NavigationButton;
	
	/**
	 * Credits Screen
	 * List the names of all the people who must get credit for their work.
	 * 
	 * @author AKM
	 */
	public class Credits extends Screens 
	{
		// button for returning to the main menu
		private var menu:NavigationButton;
		
		public function Credits() 
		{
			super("CREDITS", 0, 10);
			
		}
		
		override public function begin():void 
		{
			// Screen background
			add(new Background(Assets.CREDITS_BACKGROUND));
			super.begin();
			
			menu = new NavigationButton(360, 500, "Menu", false, 80, 40, menuButtonClick)
			add(menu);
			
		}
		
		public function menuButtonClick():void
		{
			trace("Credits class: Menu button has been clicked...");
			FP.world = new Menu("Mind the Gap");
			
		}
	}
}