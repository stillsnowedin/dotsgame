package dotsGame.views {
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.ColorButton;
	import dotsGame.views.components.Components;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	
	public class Victory extends Sprite {
		private static const SPACING:uint = 25;
		private static const BACKGROUND_WIDTH:uint = Components.LABEL_WIDTH + SPACING*2;
		private static const BACKGROUND_HEIGHT:uint = Components.LABEL_HEIGHT + Components.BUTTON_HEIGHT + SPACING*2;
		private var background:Sprite;
		private var foreground:Sprite;
		public var newGame:Signal;
		
		public function Victory():void {
			newGame = new Signal();
			background = new Sprite();
			foreground = new Sprite();
			this.addChild(background);
			this.addChild(foreground);
		}
		
		public function init(victor:String):void {
			this.x = stage.stageWidth/2 - BACKGROUND_WIDTH/2;
			this.y = stage.stageHeight/2 - BACKGROUND_HEIGHT/2;
			addBackground();
			addLabel(victor);
			addButton();
		}
		
		private function addBackground():void {
			background.addChild(BasicShapes.rectangle(BACKGROUND_WIDTH, BACKGROUND_HEIGHT, Components.GRAY));
		}
		
		private function addLabel(victor:String):void {
			foreground.addChild(Components.label(victor+" Wins!!!", SPACING, SPACING));
		}
		
		private function addButton():void {
			var button:ColorButton = Components.colorButton("NEW GAME");
			button.x = BACKGROUND_WIDTH/2 - button.width/2;
			button.y = Components.LABEL_HEIGHT + SPACING;
			button.clicked.add(function():void { newGame.dispatch(); });
			this.addChild(button);
		}
	}
}
