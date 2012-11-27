﻿package{	import flash.system.*;	import flash.utils.getDefinitionByName;	import flash.display.MovieClip;	import flash.events.Event;	import com.iainlobb.gamepad.Gamepad;	import flash.display.Stage;	import flash.geom.Point;		public class Level extends MovieClip 	{		public var main:Main;		public var enemies:Array = [];		public var items:Array = [];				public var currentLevel = 1;		public var levels = 2;				var itemLocations:Array = 		[			[				{ type: "sandwich", x: 510, y: -90 },				{ type: "sandwich", x: 800, y: -130 }			],			[				{ type: "sandwich", x: 510, y: -90 },				{ type: "sandwich", x: 800, y: -90 }			]		];						var enemyLocations:Array = 		[			[				{ type: "shooter", x: 700, y: -130 },				{ type: "walker", x: 500, y: -130 }			],			[				{ type: "walker", x: 510, y: -130 },				{ type: "walker", x: 520, y: -130 },				{ type: "walker", x: 530, y: -130 },				{ type: "walker", x: 540, y: -130 },				{ type: "walker", x: 550, y: -130 },				{ type: "walker", x: 560, y: -130 },				{ type: "walker", x: 570, y: -130 },				{ type: "walker", x: 580, y: -130 },				{ type: "walker", x: 590, y: -130 },				{ type: "walker", x: 500, y: -130 },				{ type: "walker", x: 310, y: -130 },				{ type: "walker", x: 320, y: -130 },				{ type: "walker", x: 330, y: -130 },				{ type: "walker", x: 340, y: -130 },				{ type: "walker", x: 350, y: -130 },				{ type: "walker", x: 360, y: -130 },				{ type: "walker", x: 370, y: -130 },				{ type: "shooter", x: 700, y: -130 },			 ]		];						public function Level(main:Main) 		{			this.main = main;						// Level one			this.gotoAndStop(1);			addEventListener(Event.ADDED_TO_STAGE, addedToStage);		}				private function addedToStage(event:Event)		{			x = -200;			y = stage.stageHeight - 50;						createEnemies();			createItems();		}				public function move(speed)		{			// Stop at level edges			if((speed < 0 && (x + 20) < 0) || (speed > 0 && (x + width) - 20 > stage.stageWidth))			{				x += Math.round(-speed * 10);				main.bg.move(speed);			} else if((x + width) - 50 < stage.stageWidth) {				// Level end				main.nextLevel();			}		}				public function nextLevel()		{			this.currentLevel++;						if(currentLevel > levels)			{				main.finished();			} else {				gotoAndStop(currentLevel);								x = -100;				y = stage.stageHeight - 50;								clearLevel();								createEnemies();				createItems();			}		}				public function createItems()		{						if(itemLocations[currentLevel-1].length > 0)			{				for each (var item in itemLocations[currentLevel - 1])				{					var type = item['type'].substr(0, 1).toUpperCase() + item['type'].substr(1, item['type'].length - 1).toLowerCase();																							if (ApplicationDomain.currentDomain.hasDefinition(type) ) 					{						var ref:Class = getDefinitionByName(type) as Class;						var newItem:MovieClip = new ref(main, item['x'], item['y']) as MovieClip;												addChild(newItem);						this.items.push(newItem);					}									}			}					}				public function createEnemies()		{			if(enemyLocations[currentLevel - 1].length > 0)			{				for each (var enemy in enemyLocations[currentLevel - 1])				{					var type = enemy['type'].substr(0, 1).toUpperCase() + enemy['type'].substr(1, enemy['type'].length - 1).toLowerCase();																							if (ApplicationDomain.currentDomain.hasDefinition(type) ) 					{						var ref:Class = getDefinitionByName(type) as Class;						var newEnemy:MovieClip = new ref(main, enemy['x'], enemy['y']) as MovieClip;												addChild(newEnemy);						this.enemies.push(newEnemy);					}									}			}		}				public function clearLevel()		{			for each (var enemy in enemies)			{				enemy.visible = false;				removeChild(enemy);			}						for each (var item in items)			{				item.visible = false;				removeChild(item);			}		}			}}