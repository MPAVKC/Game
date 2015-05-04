package game
{
	import Assets;
	import gtools.Background;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * Game level 1.
	 * 
	 * @author AKM
	 */
	public class LevelOne extends GameLevels 
	{
		
		public function LevelOne()
		{
			super();
			// level's time
			this.theTime = 2;
		}
		
		override public function begin():void 
		{
			// level's background 
			drawBackground(i);
			
			// the player
			player = new Player(50, 510); 
			player.layer = -1;
			add(player);
			
			// generate maps until they fill the entire screen
			while (_totalMapsWidth < FP.stage.width + FP.camera.x)
			{
				mapGenerator();
			}
			
			super.begin();
			
			this.timer.start();
			
		}
		
		override public function update():void 
		{
			 
			if (player.x < 50) 
			{
				FP.camera.x = 0;
				
			}
			else
			{
				if (player.x > 50 && player.x < 3250) {
					update_camera = Math.floor(player.x - 50);
					FP.camera.x = update_camera;
					screenComponentsLocation(player.x);
				}
			}
			
			// generate maps until they fill the entire screen
			while (_totalMapsWidth < FP.stage.width + FP.camera.x)
			{
				mapGenerator();
			}
			
			super.update();
		}
		
		/**
		 * This is a modified version of the method spawnMap from the program 
		 * 'FPDameTemplatesTutorial' by Thomas Gorence.
		 * Go to http://producerism.com/blog/flashpunk-dame-and-lua-tutorial-part-0/
		 * for more information. 
		 * 
		 * Generates all the maps for current level
		 */
		override public function mapGenerator():void
		{
			// for determining which map layer will be drawn on the screen (This level only has one layer)
			var mapLayer:String = "Level1_part1";	
			
			// notice we are using add() and not create(), which is why we're also setting recycleMaps to false
			var testMap:TilemapGeneratorEntity = new TilemapGeneratorEntity(Assets.LEVEL1_TEMPLATES_XML, mapLayer, "level", _totalMapsWidth, 0, true, false);
			add(testMap);
			
			// update the total length of the generated level so far, so we know where to place the next map
			_totalMapsWidth += testMap.mapLayerWidth;
			
		}
		
		/**
		 * Updates the new location of the hp bar, timer, coin counter, and quit
		 * 
		 * @param	newLocation // the new coordinates of the screen componets
		 */
		override public function screenComponentsLocation(newLocation:Number):void
		{
			// componentss location is update
			hp.x = (newLocation - 35);
			hp.layer = -1;
			
			timer.x = (newLocation + 220);
			timer.layer = -1;
			
			coins.x = (newLocation + 500);
			coins.layer = -1;
			
			quit.x = (newLocation + 635);
			quit.layer = -1;
			
		}
		
		/**
		 * helps decide which background must be drawn
		 * 
		 * @param	background_type  // what background should be drawn on the screen
		 */
		override public function drawBackground(background_type:int):void 
		{
			if (background_type == 1) {
				background = new Background(Assets.LEVEL1_BACKGROUND1);
				background.x = 0;
				add(background);
				
			}
			
			background.layer = 1;
		}
	}
}