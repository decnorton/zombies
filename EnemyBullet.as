﻿package  {	import flash.display.MovieClip;	import flash.events.Event;		public class EnemyBullet extends MovieClip	{		public var main:Main;				public var speedX:Number = 0;		public var speedY:Number = 0;				public var targetX:Number = 0;		public var targetY:Number = 0;				public var damage:Number = 10;				public function EnemyBullet(main:Main, damage:Number) 		{			this.main = main;			this.damage = damage;						visible = true;						addEventListener(Event.ADDED_TO_STAGE, addedToStage);		}				public function addedToStage(event:Event)		{		}				public function update()		{			if(!this.visible) return;									this.x += speedX;			this.y += speedY;						if(main.level.collide.hitTestPoint(x, y, true) || x < 0 || x > stage.stageWidth || y < 0 || y > stage.stageHeight)			{				this.destroy();			}						if(main.player.hitTestPoint(x, y, true))			{				main.player.hit(this.damage);				this.destroy();			}					}				public function destroy()		{			this.visible = false;			parent.removeChild(this);		}	}	}