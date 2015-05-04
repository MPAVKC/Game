package game
{
	import Assets;
	import gtools.Background;
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	
	//import net.flashpunk.masks.Grid;
	
	/**
	 * Game level 3.
	 * 
	 * @author ...
	 */
	public class LevelThree extends GameLevels 
	{
		// player's transportation
		private var plane:Plane;
		
		public function LevelThree()
		{
			super();
			// level's time
			this.theTime = 7;
		}
		
		override public function begin():void 
		{
			drawBackground(i);
			
			// the plane
			plane = new Plane(50, 400);
			add(plane);
			
			// the player
			player = new Player(7000, 430); 
			player.layer = 2;
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
			var tempX:Number;
			var tempY:Number;
			
			tempX = player.x;
			tempY = player.y;
			if (!plane.hasLanded) {
				update_camera = Math.floor(plane.x - 50);
				FP.camera.x = update_camera;
				screenComponentsLocation(plane.x);
			}
			else {
				if(plane.hasLanded){
					player.layer = -1;
					if (player.x < 19250)
					{
						update_camera = Math.floor(player.x - 50);
						FP.camera.x = update_camera;
						screenComponentsLocation(player.x);
					}
					if (player.x > 8000 && player.x < 11984) {
						if (player.y == 512) {
							player.x = tempX - 130;
							player.y = 100;
							mediator.theHP = -5;
						}
					}
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
			drawBackground(i);
			// for determining which map leyer will be drawn on the screen
			var mapLayer:String = "Level3_Part" + i;	
			
			// notice we are using add() and not create(), which is why we're also setting recycleMaps to false
			var testMap:TilemapGeneratorEntity = new TilemapGeneratorEntity(Assets.LEVELS_TEMPLATES_XML, mapLayer, "level", _totalMapsWidth, 0, true, false);
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
				background = new Background(Assets.LEVEL3_BACKGROUND1);
				background.x = 0;
				add(background);
				
			}else if (back == 2) {
				background = new Background(Assets.LEVEL3_BACKGROUND2);
				background.x = 8000;
				add(background);
			}else {
				background = new Background(Assets.LEVEL3_BACKGROUND3);
				background.x = 11984;
				add(background);
			}
			background.layer = 1;
		}
		
		
		
	}
}