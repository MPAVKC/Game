package game 
{
	import gstatus.Clock;
	import gstatus.HPBar;
	import gtools.Background;
	import net.flashpunk.FP;
	import gstatus.CoinsCounter;
	import gButtons.NeonButton;
	import net.flashpunk.World;
	import flash.ui.MouseCursor;
	import net.flashpunk.utils.Input;
	import gmenu.Menu;
	import net.flashpunk.Sfx;
	
	import gmenu.Mediator;
	import flash.events.Event;
	
	/**
	 * Base for the all game levels
	 * 
	 * @author AKM
	 */
	public class GameLevels extends World
	{
		protected var coins:CoinsCounter;
		protected var timer:Clock;
		protected var quit:NeonButton;
		protected var hp:HPBar;
		protected var mediator:Mediator;
		protected var i:int = 1;
		protected var background:Background;
		protected var update_camera:Number;
		
		protected var theTime:int = 0;
		
		protected var themusic:Sfx;
		protected var player:Player;
		
		protected var _totalMapsWidth:Number = 0.0;
		
		public function GameLevels()
		{
	
		}
		
		override public function begin():void 
		{
			super.begin();
			mediator = new Mediator();
			
			hp = new HPBar(15, 10, 100, 200, 25);
			add(hp);
			
			timer = new Clock(270, 10, "Time: 0 min 0 sec", 250, 25, theTime);
			add(timer);
			
			coins = new CoinsCounter(550, 10, "x ", 150, 25);
			add(coins);
			
			quit = new NeonButton(685, 10, "Quit", 100, 35, menuClick, 0xFFFFFF, 0xB990F0, 0xFFFFFF, 0xF6C7CD);
			add(quit);
			themusic = new Sfx(Assets.MUSIC)
			mediator.playMusic = true;
			
			start();
			
			if (mediator.playMusic) {
				themusic.loop();
			}
			
		}
		
		public function menuClick():void
		{
			FP.world = new Menu("Mind the Gap");
			mediator.playMusic = false;
			if (!mediator.playMusic) {
				themusic.stop();
			}
			
		}
		
		//the update method each world should have so the mouse cursor adapts correctly
		override public function update():void 
		{
			if (mediator.playMusic)
			{
				
			}else {
				themusic.stop();
			}
			Input.mouseCursor = MouseCursor.AUTO;
			
			super.update();
		}
		
		public function start():void
		{
			FP.stage.addEventListener(Event.ENTER_FRAME, timerHandler);
		}
		
		public function timerHandler(event:Event):void 
		{
			if (mediator.gameOver) {
				FP.world = new GameOver();
				stop();
			}
			
			if (mediator.reachDestination)
			{
				if (mediator.level1Complete)
				{
					mediator.level1Complete = false;
					mediator.reachDestination = false;
					stop();
					mediator.game_data.data.level1Time = mediator.game_data.data.tempTime;
					if (!mediator.playMusic) {
						themusic.stop();
					}
					FP.world = new CongratulatoryMessage(Assets.MESSAGE);
					
				}
				if (mediator.level2Complete)
				{
					mediator.level2Complete = false;
					mediator.reachDestination = false;
					stop();
					mediator.game_data.data.level2Time = mediator.game_data.data.tempTime;
					if (!mediator.playMusic) {
						themusic.stop();
					}
					FP.world = new CongratulatoryMessage(Assets.MESSAGE);
					
				}
				if (mediator.level3Complete)
				{
					mediator.gotoscores = true;
					mediator.reachDestination = false
					stop();
					mediator.game_data.data.level3Time = mediator.game_data.data.tempTime;
					if (!mediator.playMusic) {
						themusic.stop();
					}
					FP.world = new CongratulatoryMessage(Assets.MESSAGE);
					mediator.game_data.clear();

				}
				mediator.theLevel += 1;
				
			}
			
		}
		
		public function stop():void 
		{
			FP.stage.removeEventListener(Event.ENTER_FRAME, timerHandler);
			timer.stop();
		}
		
		/**
		 * This is a modified version of the method spawnMap from the program 
		 * 'FPDameTemplatesTutorial' by Thomas Gorence.
		 * Go to http://producerism.com/blog/flashpunk-dame-and-lua-tutorial-part-0/
		 * for more information. 
		 * 
		 * Generates all the maps for current level
		 */
		public function mapGenerator():void
		{
			
		}
		
		/**
		 * Updates the new location of the hp bar, timer, coin counter, and quit
		 * 
		 * @param	newLocation // the new coordinates of the screen componets
		 */
		public function screenComponentsLocation(newLocation:Number):void
		{
			
		}
		
		/**
		 * helps decide which background must be drawn
		 * 
		 * @param	background_type  // what background should be drawn on the screen
		 */
		public function drawBackground(background_type:int):void {
			
		}
	}
}