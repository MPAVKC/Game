package  
{
	/**
	 * Here is the list of all the assets we will be using for the game.
	 * 
	 * Note: These are not our own assets. They were taken from the internet.
	 * We don't own any rights for these images. Credit goes to the author
	 * or owner of the image. For more information, visit their corresponsing
	 * websites. 
	 */
	public class Assets 
	{	
		
												/***** BACKGROUNDS *****/
		
				/* General backgrounds for the screems */
				
		// Main Menu background
		[Embed(source = "../assets/images/menu.png")] public static const MENU:Class;
		
		// Toturial background (http://www.city-data.com/forum/city-vs-city/1283079-providence-vs-hartford-vs-albany.html)
		[Embed(source = "../assets/images/tutorial1.png")] public static const TUTORIAL1_BACKGROUND:Class;
		[Embed(source = "../assets/images/tutorial2.png")] public static const TUTORIAL2_BACKGROUND:Class;
		[Embed(source = "../assets/images/tutorial3.png")] public static const TUTORIAL3_BACKGROUND:Class;
		[Embed(source = "../assets/images/tutorial4.png")] public static const TUTORIAL4_BACKGROUND:Class;
		
		// Cridits background (http://media.royalcaribbean.com/content/shared_assets/images/ports/hero/BOS_01.jpg)
		[Embed(source = "../assets/images/boston.png")] public static const CREDITS_BACKGROUND:Class;
		
		// Game Over background (http://el-tortuga.deviantart.com/art/Classic-Game-Over-Screen-326521065)
		[Embed(source = "../assets/images/gameover.png")] public static const GAMEOVER:Class;
		
				/* Backgroud for Level 1 */
		
		[Embed(source = "../assets/map/level1_part1.png")] public static const LEVEL1_BACKGROUND1:Class;
		
				/* Backgroud for Level 2 */ 
		[Embed(source = "../assets/map/level2_part1.png")] public static const LEVEL2_BACKGROUND1:Class;
		[Embed(source = "../assets/map/level2_part2.png")] public static const LEVEL2_BACKGROUND2:Class;
		
		// Congratulatory message background
		[Embed(source = "../assets/images/blackscreen.png")] public static const MESSAGE:Class;
		
				/* Backgroud for Level 3 */
		[Embed(source = "../assets/map/level3_part1.png")] public static const LEVEL3_BACKGROUND1:Class;
		
		// http://www.clker.com/clipart-city-skyline-1.html
		// http://www.clker.com/clipart-passing-zone-1.html
		[Embed(source = "../assets/map/level3_part2.png")] public static const LEVEL3_BACKGROUND2:Class;
		
		[Embed(source = "../assets/map/level3_part3.png")] public static const LEVEL3_BACKGROUND3:Class;
		
		
												/***** SPRITES *****/
		
				/* Sprites for all level screens */
		
		// Sprite for the player (http://mapleme.net)
		[Embed(source = "../assets/images/William.png")] public static const WILLIAM:Class;
		
		// Sprite for the coin counter  @author JM.Atencia (http://opengameart.org/content/spinning-coin)
		[Embed(source = "../assets/images/coin.png")] public static const COIN_COUNTER:Class;
		
		// Sprite for the coins that can be collected thorughout the game (http://opengameart.org/content/spinning-coin)
		[Embed(source = "../assets/map/coins.png")] public static const COIN:Class;
		
				/* Sprites only for Level 1 */
		
		// Sprite for the train
		[Embed(source = "../assets/map/ticket.png")] public static const TRAIN_TICKET:Class;
		[Embed(source = "../assets/map/needle.png")] public static const NEEDLE:Class;
		
				/* Sprites only for Level 2 */
		
		// Sprite for the train (http://forum.chaos-project.com/index.php?topic=11793.0)
		[Embed(source = "../assets/map/train.png")] public static const TRAIN:Class;
		
		// Sprite for the squirrel  (http://www.walkaboutcrafts.com/freegifts/clipart1.htm)
		[Embed(source = "../assets/map/squirrel.png")] public static const SQUIRREL:Class;
		
		// Sprite for the plane ticket  (http://cliparts.co/ticket-clipart)
		[Embed(source = "../assets/map/planeticket.png")] public static const PLANE_TICKET:Class;
		
				/* Sprites only for Level 3 */
		
		// Sprite for the the red crystals  // @author qubodup (http://opengameart.org/content/rotating-crystal-animation-8-step)
		[Embed(source = "../assets/map/redcrystal.png")] public static const CRYSTAL:Class;
		
		// Sprite for the clouds (visit http://pixgood.com/transparent-cloud-clipart.html)
		[Embed(source = '../assets/map/cloud.png')] public static const CLOUD:Class;	
	
		// Sprite of a queen for ending the level (http://mapleme.net)
		[Embed(source = "../assets/map/queen.png")] public static const QUEEN:Class;
		
		// Sprite for the plane (http://genderer.com/methods-to-get-international-airline-tickets-discount/)
		[Embed(source = "../assets/images/plane.png")] public static const PLANE:Class;
		
		// Sprite for the spikes  @author rubberduck (http://opengameart.org/content/pixel-art-castle-tileset)
		[Embed(source = '../assets/map/spike.png')] public static const SPIKE:Class;
		
		
												/***** TILESETS, LEVEL TEMPLATES & OBJECTS *****/
				
				/* Level 1 */
		// Tilesets
		[Embed(source = '../assets/map/tile.png')] public static const TILES_1_1:Class;
		
		// Templates
		[Embed(source = '../assets/map/Level1_maps.xml', mimeType="application/octet-stream")]
		public static const LEVEL1_TEMPLATES:Class;
		
		// lets convert the asset into an XML now, so we only have to do it once
		public static const LEVEL1_TEMPLATES_XML:XML = new XML(new LEVEL1_TEMPLATES);
		
		// and while we're at it, let's get the total count of templates too
		public static const LEVEL1_TEMPLATES_COUNT:Number = LEVEL1_TEMPLATES_XML.tiles.length();
		
				/* Level 2 */
		// Tilesets
		[Embed(source = '../assets/map/sidewalk.png')] public static const TILES_2_1:Class;
		[Embed(source = '../assets/map/box.png')] public static const TILES_2_2:Class;
		
		// Templates
		[Embed(source = '../assets/map/Level2_maps.xml', mimeType="application/octet-stream")]
		public static const LEVEL2_TEMPLATES:Class;
		
		// lets convert the asset into an XML now, so we only have to do it once
		public static const LEVEL2_TEMPLATES_XML:XML = new XML(new LEVEL2_TEMPLATES);
		
		// and while we're at it, let's get the total count of templates too
		public static const LEVEL2_TEMPLATES_COUNT:Number = LEVEL2_TEMPLATES_XML.tiles.length();

				/* Level 3 */
		// Tilesets
		// (http://www.photonstorm.com/flash-game-dev-tips/flash-game-dev-tip-12-building-a-retro-platform-game-in-flixel-part-1)
		[Embed(source = '../assets/map/tiles.png')] public static const TILES_3_1:Class;
		
		// software_atelier (http://opengameart.org/content/city-pixel-tileset)
		[Embed(source = '../assets/map/city.png')] public static const TILES_3_2:Class;
		
		// @author rubberduck (http://opengameart.org/content/pixel-art-castle-tileset)
		[Embed(source = '../assets/map/castle.png')] public static const TILES_3_3:Class;
		
		// Templates
		[Embed(source = '../assets/map/Level3_maps.xml', mimeType="application/octet-stream")]
		public static const LEVELS_TEMPLATES:Class;
		
		// lets convert the asset into an XML now, so we only have to do it once
		public static const LEVELS_TEMPLATES_XML:XML = new XML(new LEVELS_TEMPLATES);
		
		// and while we're at it, let's get the total count of templates too
		public static const LEVELS_TEMPLATES_COUNT:Number = LEVELS_TEMPLATES_XML.tiles.length();
		
		// Objtects
		Coins;
		Cloud;
		Queen;
		Crystal;
		Spike;
		TrainTicket;
		PlaneTicket;
		Needle;
		Squirrel;
		
												/***** AUDIO *****/
		// http://www.newgrounds.com/audio/listen/607238
		[Embed(source = "../assets/audio/gamebackgroundmusic.mp3")] public static const MUSIC:Class;
		
	}
}