package dotsGame.views {
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.ColorButton;
	import dotsGame.views.components.Components;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	
	public class Victory extends Sprite {
		private static const MARGIN:uint = 20;
		private static const BACKGROUND_WIDTH:uint = Components.HEADER_WIDTH;
		private static const BACKGROUND_HEIGHT:uint = Components.LABEL_HEIGHT + Components.BUTTON_HEIGHT + MARGIN;
		private var background:Sprite;
		private var foreground:Sprite;
		public var newGame:Signal;
		
		public function Victory():void {
			newGame = new Signal();
			background = new Sprite();
			foreground = new Sprite();
		}
		
		public function init(victor:String):void {
			initContainers();
			addBackground();
			addLabel(victor);
			addButton();
		}
		
		private function initContainers():void {
			this.x = stage.stageWidth/2 - BACKGROUND_WIDTH/2;
			this.y = stage.stageHeight/2 - BACKGROUND_HEIGHT/2;
			this.addChild(background);
			this.addChild(foreground);
		}
		
		private function addBackground():void {
			background.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH, BACKGROUND_HEIGHT, Components.BG_COLOR));
		}
		
		private function addLabel(victor:String):void {
			foreground.addChild(Components.header(victor+" Wins!!!"));
		}
		
		private function addButton():void {
			var button:ColorButton = Components.colorButton("NEW GAME");
			button.x = BACKGROUND_WIDTH/2 - button.width/2;
			button.y = Components.LABEL_HEIGHT;
			button.clicked.add(function():void { newGame.dispatch(); });
			this.addChild(button);
		}
		
		public function destroy():void {
			background.removeChildren();
			foreground.removeChildren();
			this.removeChildren();
			newGame.removeAll();
		}
	}
}
