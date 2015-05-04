package gmenu
{
	import adobe.utils.CustomActions;
	import flash.net.SharedObject;
	
	/**
	 * ...
	 * @author MKA
	 */
	public class Mediator
	{
		// for storing data locally
		public var game_data:SharedObject;
		
		public function Mediator() 
		{
			// creates the object on which the data will be stored
			game_data = SharedObject.getLocal('data');
			
		}
		
		/**
		 * checks whether any game level has been played
		 */
		public function gameLevel():void
		{
			// if no level has been played yet, then the player will 
			// start playing the first level 
			if (game_data.data.level == null)
			{
				game_data.data.level = 1;
				game_data.data.totalscores = 0;
			}
		}
		
		/** 
		 * get current level of the game
		 */
		public function get theLevel():int
		{
			var level:int = game_data.data.level;
			return level;
		}
		
		/* 
		 * set the next level of the game
		 */
		public function set theLevel(setLevel:int):void
		{
			game_data.data.level = setLevel;
		}
		
		
		/**
		 * checks for the number of coins
		 */
		public function gameCoins():void
		{
			if (game_data.data.coins == null)
			{
				game_data.data.coins = 0;
			}
		}
		
		/**
		 * get the current number of coins
		 */
		public function get thecoinsnum():int
		{
			gameCoins();
			var number_of_coins:int = game_data.data.coins;
			
			return number_of_coins;
		}
		
		/**
		 * set the new number of coins
		 */
		public function set thecoinsnum(setCoinNum:int):void
		{
			var number_of_coins:int = game_data.data.coins;
			game_data.data.coins = number_of_coins + setCoinNum;
		}
		
		/**
		 * when the player complites a particular, we tell the mediator that thhe levels has been
		 * completed
		 */
		public function set reachDestination(destination:Boolean):void
		{
			game_data.data.reachdestination = destination;
		}
		
		/**
		 * checks whether a levels has been completed 
		 */
		public function get reachDestination():Boolean
		{
			var end_of_trip:Boolean = false;
			if (game_data.data.reachdestination)
			{
				end_of_trip = true;
			}
			
			return end_of_trip;
		}
		
		/**
		 * gets the current health points of the player
		 */
		public function get theHP():int
		{
			var health_points:int = game_data.data.healthPoints;
			
			return health_points;
		}
		
		/**
		 * updates the health points of the players
		 */
		public function set theHP(setHP:int):void
		{
			var health_points:int = game_data.data.healthPoints;
			health_points = health_points + setHP;
			game_data.data.healthPoints = health_points;
			
			if (game_data.data.healthPoints > 100) {
				game_data.data.healthPoints = 100;
			}
			else {
				if (game_data.data.healthPoints < 0)
				{
					game_data.data.healthPoints = 0;
				}
			}
			
		}
		
		/**
		 * checks whether the level has ended because the player HP is zero or time ran out
		 */
		public function get gameOver():Boolean
		{
			var gameover:Boolean = false;
			if ((game_data.data.healthPoints == 0))
			{
				gameover = true;
				
			}
			if (game_data.data.timeRunOut)
			{
				gameover = true;
			}
			return gameover;
		}
		
		/**
		 * when level 1 has been completed
		 */
		public function set level1Complete(complete:Boolean):void
		{
			game_data.data.level1 = true;
		}
		
		/**
		 * checks whether level 1 has been completed
		 */
		public function get level1Complete():Boolean
		{
			var levelcomplete:Boolean = false;
			if (game_data.data.level1 == true)
			{
				levelcomplete = true;
			}
			return levelcomplete;
		}
		
		/**
		 * when level 2 has been completed
		 */
		public function set level2Complete(complete:Boolean):void
		{
			game_data.data.level2 = true;
		}
		
		/**
		 * checks whether level 2 has been completed
		 */
		public function get level2Complete():Boolean
		{
			var levelcomplete:Boolean = false;
			if (game_data.data.level2 == true)
			{
				levelcomplete = true;
			}
			return levelcomplete;
		}
		
		/**
		 * when level 3 has been completed
		 */
		public function set level3Complete(complete:Boolean):void
		{
			game_data.data.level3 = true;
		}
		
		/**
		 * checks whether level 3 has been completed
		 */
		public function get level3Complete():Boolean
		{
			var levelcomplete:Boolean = false;
			if (game_data.data.level3 == true)
			{
				levelcomplete = true;
			}
			return levelcomplete;
		}
		
		/**
		 * tells the mediator if player wanst to go to the scores scren
		 */
		public function set gotoscores(goto:Boolean):void
		{
			game_data.data.gotoScores = goto;
		}
		
		/**
		 * if player wants to see the scores
		 */
		public function get gotoscores():Boolean
		{
			var go:Boolean = false;
			if (game_data.data.gotoScores)
			{
				go = true;
			}
			return go;
		}
		
		/**
		 * stores the scores for the levels
		 */
		public function set totalScores(add:Number):void
		{
			var total:Number = game_data.data.totalscores;
			total += add;
			game_data.data.totalscores = total;
		}
		
		/**
		 * 
		 */
		public function get totalScores():Number
		{
			return game_data.data.totalscores;
		}
		
		/**
		 * tell the mediator that the time is out
		 */
		public function set timerunout(timeout:Boolean):void
		{
			game_data.data.timeRunOut = true;
		}
		
		/**
		 * checks whther time is out
		 */
		public function get timerunout():Boolean
		{
			var timeout:Boolean = false;
			if (game_data.data.RunOut == true)
			{
				timeout = true;
			}
			return timeout;
		}
		
		/**
		 * checks whether or not music should be played
		 */
		public function get playMusic():Boolean
		{
			var play:Boolean = false;
			
			if (game_data.data.music == true)
			{
				play = true;
			}
			return play;
		}
		
		/**
		 * tells the mediator if music should be played
		 */
		public function set playMusic(play:Boolean):void
		{
			game_data.data.music = play;
		}
		
	}
	
}