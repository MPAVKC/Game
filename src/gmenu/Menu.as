package gmenu 
{
	import Assets;
	import gtools.Background;
	import net.flashpunk.FP;
	import flash.ui.MouseCursor;
	import net.flashpunk.utils.Input;
	import gButtons.BlueButton;
	import game.LevelOne;
	import game.LevelTwo;
	import game.LevelThree;
	import flash.events.Event;
	
	
	/**
	 * Menu for the game
	 * 
	 * @author AKM
	 */
	public class Menu extends Screens
	{	
		// buttons for the menu
		private var playButton:BlueButton;
		private var tutorialButton:BlueButton;
		private var scoresButton:BlueButton;
		private var creditsButton:BlueButton;
		
		// lets the menu communicate inderectly with other classes
		private var mediator:Mediator;
		
		/**
		 * 
		 * @param	title: name of the game
		 */
		public function Menu(title:String) 
		{
			super(title, 0, 20);
			
		}
		
		/**
		 * main menu is initiated
		 */
		override public function begin():void 
		{	
			add(new Background(Assets.MENU));
			
			// no acess to the scores for the moment;
			mediator = new Mediator();
			mediator.gotoscores = false;
			
			// buttons are drawn on the screen
			playButton = new BlueButton(125, 500, "Play", 100, 50, playButtonClick);
			tutorialButton = new BlueButton(350, 500, "Tutorial", 100, 50, tutorialButtonClick);
			creditsButton = new BlueButton(575, 500, "Credits", 100, 50, creditsButtonClick);
			
			add(playButton);
			add(tutorialButton);
			add(creditsButton);
			
			super.begin();
			
		}
		
		/**
		 * the actions that happen when the play button is clicked 
		 */
		private function playButtonClick():void
		{	
			mediator.gameLevel();
			
			// gets the game level the user will play 
			var current_level:int = mediator.game_data.data.level;
			
			// determines the game level that will be played
			switch(current_level)
			{
				case 1:
					
					FP.world = new LevelOne()
					mediator.game_data.data.destination = "the 'Train Station'";
					FP.world.removeAll();
					break;
				
				case 2:
					FP.world = new LevelTwo();
					mediator.game_data.data.destination = "Logan International Airport";
					FP.world.removeAll();
					break;
				
				case 3:
					FP.world = new LevelThree();
					mediator.game_data.data.destination = "London, England'";
					FP.world.removeAll();
					break;
					
			}
		}
		
		/**
		 * actions for the tutorial button
		 */
		private function tutorialButtonClick():void
		{
			//ceates the tutorial screen
			FP.world = new GameInstructions(Assets.TUTORIAL1_BACKGROUND);
		}
		
		/**
		 * actions for the credits button
		 */
		private function creditsButtonClick():void
		{
			// creates the scores screen
			FP.world = new Credits();
		}
		
	}
}