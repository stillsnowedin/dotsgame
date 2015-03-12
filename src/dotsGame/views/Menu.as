package dotsGame.views {
	import dotsGame.views.components.ColorButton;
	import dotsGame.views.components.Components;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextFormat;

	public class Menu extends Sprite {
		private static const BUTTON_SIZE:Point = new Point(120, 50);
		private static const BUTTON_OFFSET:Number = 10;
		private static const BUTTON_NAMES:Vector.<String> = new <String>["Start", 
																		 "Options", 
																		 "Quit"];
		private var buttonHandlers:Vector.<Function> = new <Function>[startClicked, 
																	  optionsClicked, 
																	  quitClicked];
		public var startGame:Signal;
		public var openOptions:Signal;
		public var quitGame:Signal;
		
		public function Menu():void {
			startGame = new Signal();
			openOptions = new Signal();
			quitGame = new Signal();
		}
		
		public function init():void {
			drawButtons();
		}
		
		private function drawButtons():void {
			for (var i:int=0; i<BUTTON_NAMES.length; i++) {
				var buttonPos:Point = new Point();
				buttonPos.x = stage.stageWidth/2 - BUTTON_SIZE.x/2; 
				buttonPos.y = stage.stageHeight/2 - BUTTON_SIZE.y/2 + (BUTTON_SIZE.y + BUTTON_OFFSET)*i;
				drawButton(BUTTON_NAMES[i], buttonPos, buttonHandlers[i]);
			}
		}
		
		private function drawButton(buttonName:String, buttonPosition:Point, buttonHandler:Function):void {
			var buttonFormat:TextFormat = Components.buttonTextFormat(30, 0xFFFFFF);
			var button:ColorButton = Components.colorButton(0x229922, 0x22ff22, 0x55ff22, 
													   		BUTTON_SIZE, 
													   		buttonPosition);
			button.setLabel(buttonName, buttonFormat);
			button.clicked.add(buttonHandler);
			this.addChild(button);
		}
		
		private function startClicked():void {
			startGame.dispatch();
		}
		
		private function optionsClicked():void {
			openOptions.dispatch();
		}
		
		private function quitClicked():void {
			quitGame.dispatch();
		}
	}
}
