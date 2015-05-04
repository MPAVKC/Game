package  game
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	import flash.utils.getDefinitionByName;
	
	/**
	* FlashPunk, DAME and LUA Tutorial
	* 
	* @author 	Thomas Gorence
	* @see		http://producerism.com
	* 
	* This tutorial was written to be followed along
	* with a series on the producerism.com/blog
	*/	

	public class TilemapGeneratorEntity extends Entity
	{
		/* DEVELOPER NOTE:
		 * these variables should technically be made private,
		 * with getters and setters for each.  That would have
		 * made this file a bit harder to follow, so for
		 * tutorial purposes, I've made them all public.
		*/
		
		public var _xmlAsset:*;				// the exported XML file from DAME (in Assets.as)
		public var _tilesetAsset:*;			// the tileset PNG used in DAME (in Assets.as)
		public var _layerName:String;		// the name of the map layer in DAME
		public var _x:Number;
		public var _y:Number;
		public var _width:uint;
		public var _height:uint;
		public var _tileWidth:uint;
		public var _tileHeight:uint;
		public var _collisionType:String;	// the FlashPunk collision group for the generated map
		public var _parseSprites:Boolean;	// if true, this will also parse any sprites which go with the map
		public var _recycleMaps:Boolean;	// if true, this will use FP.world.recycle instead of FP.world.remove
				
		public function TilemapGeneratorEntity($xmlAsset:*= null, $layerName:String = null, $collisionType:String = null, $x:Number = 0.0, $y:Number = 0.0, $parseSprites:Boolean = true, $recycleMaps:Boolean = true ) 
		{
			_xmlAsset = $xmlAsset;
			_layerName = $layerName;
			if ($layerName == "Level1_part1") {
				_tilesetAsset = Assets.TILES_1_1;
			}
			if ($layerName == "Level2_part1") {
				_tilesetAsset = Assets.TILES_2_1;
			}
			if ($layerName == "Level2_part2") {
				_tilesetAsset = Assets.TILES_2_2;
			}
			if (_layerName == "Level3_Part1") {
				_tilesetAsset = Assets.TILES_3_1;
			}
			if ($layerName == "Level3_Part2") {
				_tilesetAsset = Assets.TILES_3_2;
			}
			if ($layerName == "Level3_Part3") {
				_tilesetAsset = Assets.TILES_3_3;
			}
			
			
			_collisionType = $collisionType;
			_x = $x;
			_y = $y;
			_parseSprites = $parseSprites;
			_recycleMaps = $recycleMaps;
		}
		
		override public function added():void 
		{
			/* DEVELOPER NOTE:
			 * all of this information is done within the added() function,
			 * because using FP.world.create() requires passing the class
			 * with no paramters.  So we call a new instance with default
			 * constructor paramters, then set each variable directly
			 * from wherever FP.world.create() was called.
			*/
			
			// let's focus on the map layer, based on the layer name that was passed in
			var _tileLayer:XMLList = _xmlAsset.tiles.(@layer == _layerName);			
			
			// we set width/height/etc here for convenience, but we can't rely on having
			// the information instantly, which is why mapLayerWidth() getter function
			// was created (bottom).  It would be replaced with a width() getter function.
			_width = _tileLayer.@width;
			_height = _tileLayer.@height;
			_tileWidth = _tileLayer.@tileWidth;
			_tileHeight = _tileLayer.@tileHeight;		
			
			// Build the empty tilemap and grid
			var _tiles:Tilemap = new Tilemap(_tilesetAsset, _width, _height, _tileWidth, _tileHeight);
			var _grid:Grid = new Grid(_width, _height, _tileWidth, _tileHeight);
			mask = _grid;
			
			// parse the map layer xml
			for each(var tile:XML in _tileLayer.tile)
			{
				
				// add the tile to the tilemap
				_tiles.setTile(
					(tile.@x / _tileWidth),
					tile.@y / _tileHeight,
					_tiles.getIndex(
						tile.@tx / _tileWidth, tile.@ty / _tileHeight
					)
				);				
				// add the tile to the grid for collision detection
				_grid.setTile(
					tile.@x / _tileWidth,
					tile.@y / _tileHeight
				);
			}
			
			// only add sprites if flagged to do so
			if (_parseSprites)
			{
				// now let's focus on any sprite layer with the same name as the map layer
				var _spriteLayer:XMLList = _xmlAsset.sprites.(@layer == _layerName);
				
				for each(var sprite:XML in _spriteLayer.sprite)
				{
					// does the sprite have a spawnAmount attribute?  If not, set spawnAmount to 1
					var spawnAmount:uint = (sprite.@spawnAmount == undefined) ? 1 : uint(sprite.@spawnAmount);
					
					// create the sprites
					for (var spawnCounter:uint = 0; spawnCounter < spawnAmount; spawnCounter++)
					{
						// since we're referencing classes dynamically, we can't be sure they actually exist
						try
						{
							var spriteClass:Class = getDefinitionByName(String(sprite.@className)) as Class;
						} catch (err:Error)
						{
							trace(String(sprite.@className) + " class not found!");
							continue;
						}
						
						// by default, we're using FP.world.create(), and assuming that entities will be recycled
						// by passing false as the second paramter, we tell FlashPunk not to add the entity yet
						var spriteEntity:Entity = FP.world.create(spriteClass, false);
						
						// set the sprite position, offset by the map layer's x/y positions (this is a DAME workaround)
						if (sprite.@spawnShape == undefined)
						{
							spriteEntity.x = (Number(sprite.@x) - Number(_tileLayer.@x)) + _x;
							spriteEntity.y = (Number(sprite.@y) - Number(_tileLayer.@y)) + _y;
						}
						else
						{
							// if spawnShape was defined, use the area to generate random placement
							var spawnShape:XMLList = _xmlAsset.shapes.shape.(@guid == sprite.@spawnShape);
							var spawnMinX:Number = Number(spawnShape.@x) + Number(sprite.@width) / 2;
							var spawnMaxX:Number = Number(spawnShape.@x) + Number(spawnShape.@width) - Number(sprite.@width) / 2;
							var spawnMinY:Number = Number(spawnShape.@y) + Number(sprite.@height) / 2;
							var spawnMaxY:Number = Number(spawnShape.@y) + Number(spawnShape.@height) - Number(sprite.@height) / 2;
							
							spriteEntity.x = int((Math.random() * (spawnMaxX - spawnMinX + 1) + spawnMinX - int(_tileLayer.@x)) + _x);
							spriteEntity.y = int((Math.random() * (spawnMaxY - spawnMinY + 1) + spawnMinY - int(_tileLayer.@y)) + _y);
						}
						
						// we've already created the entity, now add it
						FP.world.add(spriteEntity);
					
					}
				}			
			}
			
			// set the graphic to the tilemap that was just created from xml
			graphic = _tiles;
			x = _x;
			y = _y;
			type = _collisionType;
			
			super.added();
		}
		
		override public function update():void 
		{
			// once the tilemap goes off camera, we discard it
			if (x < FP.camera.x - width)
			{
				if (_recycleMaps)
				{
					// recycling tells FlashPunk to re-use this entity
					// when calling FP.world.create() on the same class
					FP.world.recycle(this);
				} else {
					// removing tells FlashPunk to destroy the entity
					// this leaves it up to flash's garbage collection
					FP.world.remove(this);
				}
			}
			
			super.update();
		}
		
		// since we can't rely on _width property to have the information right away,
		// this getter function will retrieve the info directly from the xml asset
		public function get mapLayerWidth():int { 
			return int(_xmlAsset.tiles.(@layer == _layerName).@width); }
		
	}

}