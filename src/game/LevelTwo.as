package game
{
	import Assets;
	import gtools.Background;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	/**
	 * Game level 2.
	 * 
	 * @author AKM
	 */
	public class LevelTwo extends GameLevels 
	{
		// player's land transportation
		private var train:Train;
		
		public function LevelTwo()
		{
			super();
			
			// level's time
			this.theTime = 5;
		}
		
		override public function begin():void 
		{
			drawBackground(i);
			
			// player's transportation
			train = new Train(390, 360);
			add(train);
			
			// the player
			player = new Player(11000, 480); // 50, 480
			player.layer = -1;
			add(player);
			
			player.jump = 24;
			
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
			if (!player.rideTrain) {
				if(player.x < 340){
					update_camera = Math.floor(player.x - 50);
					FP.camera.x = update_camera;
					screenComponentsLocation(player.x);
					
				}
				if (player.x > 625) {
					player.layer = 2;
					player.rideTrain = true;
					train.startMoving = true;
				}
			}
			if (train.startMoving) {
				update_camera = Math.floor(train.x -100);
				FP.camera.x = update_camera;
				screenComponentsLocation(train.x - 50);
				player.x = train.x + 230;
			}
			if(train.hasArrived && player.x < 12150) {
				player.layer = -1;
				update_camera = Math.floor(player.x-330);
				FP.camera.x = update_camera;
				screenComponentsLocation(player.x - 280);
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
			drawBackground(i);
			// for determining which map leyer will be drawn on the screen
			var mapLayer:String = "Level2_part" + i;	
			
			// notice we are using add() and not create(), which is why we're also setting recycleMaps to false
			var testMap:TilemapGeneratorEntity = new TilemapGeneratorEntity(Assets.LEVEL2_TEMPLATES_XML, mapLayer, "level", _totalMapsWidth, 0, true, false);
			add(testMap);
			
			// update the total length of the generated level so far, so we know where to place the next map
			_totalMapsWidth += testMap.mapLayerWidth;
			
			i += 1;
		}
		
		/**
		 * Updates the new location of the hp bar, timer, coin counter, and quit
		 * 
		 * @param	newLocation // the new coordinates of the screen componets
		 */
		override public function screenComponentsLocation(newLocation:Number):void
		{
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
		override public function drawBackground(back:int):void {
			if (back == 1) {
				background = new Background(Assets.LEVEL2_BACKGROUND1);
				background.x = 0;
				add(background);
			}
			if (back == 2) {
				background = new Background(Assets.LEVEL2_BACKGROUND2);
				background.x = 4640;
				add(background);
			}
			background.layer = 1;
		}
	}
}