package game 
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Key;
	import gmenu.Mediator;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;

	/**
	 * This class has been modified from it original version to 
	 * adapt it to this program.
	 * Credits go to:
	 * 
	 * @author <Charles Goatley>
	 */
	public class Player extends Entity
	{
		private var power:Number=0.5;
		public var jump:Number=18;
		private var hFriction:Number=0.90;
		private var vFriction:Number=0.99;
		private var xSpeed:Number=0;
		private var ySpeed:Number=0;
		private var gravity:Number = 0.9;
		
		private var mediator:Mediator;
		public var rideTrain:Boolean = false;
		
		public var the_player:Spritemap;
		
		public function Player(xLoc:Number, yLoc:Number) 
		{
			x = xLoc;
			y = yLoc;
			
			mediator = new Mediator();
			
			the_player = new Spritemap(Assets.WILLIAM, 48, 64);
			the_player.add("idle", [0, 1, 2], 4, true);
			the_player.add("move", [4, 5, 6, 7], 10, true);
			the_player.add("jump", [3], 10, true);
			setHitbox(32, 64);
			graphic = the_player;
			
			type = "player"; 
			the_player.play("idle");
		}
		
		override public function update():void
		{
			var pressed:Boolean = false;
			var hasJumped:Boolean = false;
			if ( Input.check(Key.A) )
			{
				the_player.flipped = true;
				xSpeed -= power;
				pressed = true;
			}
			
			else if (Input.check(Key.D) )
			{
				the_player.flipped = false;
				xSpeed += power;
				pressed=true;
			}
			
			if (collide("level",x,y+1)) {
				ySpeed=0;
				if (Input.check(Key.SPACE)) {
					ySpeed -= jump;
					hasJumped = true;
				}
			} else {
				ySpeed+=gravity;
			}
			if (Math.abs(xSpeed)<1&&! pressed) {
				xSpeed=0;
			}
			xSpeed*=hFriction;
			ySpeed *= vFriction;
			
		
			if (hasJumped) {
				the_player.play("jump");
			}
			else {
				if (pressed) {
					the_player.play("move");
				}else {
					the_player.play("idle");
				}
			}
			
			
			
			moveBy(xSpeed, ySpeed, "level");
			
			// Update collisions.
			var coin:Coins = collide("coin", x, y) as Coins;
			var crystal:Crystal = collide("crystal", x, y) as Crystal;
			var queen:Queen = collide("queen", x, y) as Queen;
			var train_ticket:TrainTicket = collide("ticket", x, y) as TrainTicket;
			var needle:Needle = collide("needle", x, y) as Needle;
			var spike:Spike = collide("spike", x, y) as Spike;
			var squirrel:Squirrel = collide("squirrel", x, y) as Squirrel;
			var plane_ticket:PlaneTicket = collide("planeticket", x, y) as PlaneTicket;
			
			
			if (plane_ticket)
			{
				if (mediator.thecoinsnum > 50)
				{
					mediator.thecoinsnum = -50;
					plane_ticket.destroy();
				}
				
			}
			
			if (squirrel) {
				mediator.thecoinsnum = -1;
				squirrel.destroy();
			}
			
			if (coin)
			{
				mediator.thecoinsnum = 1;
				coin.destroy();
			}
			if (queen)
			{
				mediator.reachDestination = true;
				queen.destroy();
			}
			
			
			if (needle)
			{
				needle.destroy();
			}
			
			if (crystal)
			{
				mediator.thecoinsnum = 2;
				crystal.destroy();
			}
			if (spike) 
			{

				mediator.theHP = -5;
				spike.destroy();
			}
			
			if (train_ticket) {
				if (mediator.thecoinsnum > 30) {
					mediator.thecoinsnum = -30;
					train_ticket.destroy();
				}
				
				
			}
			
			super.update();
		}
		
	}

}