package dotsGame.views {
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Components;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Status extends Sprite {
		private static const HEIGHT:Number = 100;
		private static const RECTANGLE_WIDTH:Number = 512;
		private static const LABEL_WIDTH:Number = 200;
		private static const NUMBER_WIDTH:Number = 50;
		private static const SPACING:Number = 150;
		private var background:Sprite;
		private var textfields:Sprite;
		
		public function Status():void {
			background = new Sprite();
			textfields = new Sprite();
			this.addChild(background);
			this.addChild(textfields);
		}
		
		public function init():void {
			drawRectangles();
			createTextFields();
		}
		
		private function drawRectangles():void {
			background.addChild(firstPlayerRect());
			background.addChild(secondPlayerRect());
		}
		
		private function firstPlayerRect():Shape {
			var rect:Shape = BasicShapes.createRectangle(RECTANGLE_WIDTH, HEIGHT, 0x1177CC);
			return rect;
		}
		
		private function secondPlayerRect():Shape {
			var rect:Shape = BasicShapes.createRectangle(RECTANGLE_WIDTH, HEIGHT, 0xCC1111);
			rect.x = RECTANGLE_WIDTH;
			return rect;
		}
		
		private function createTextFields():void {
			textfields.addChild(firstPlayerLabel());
			textfields.addChild(firstPlayerScore());
			textfields.addChild(secondPlayerLabel());
			textfields.addChild(secondPlayerScore());
		}
		
		private function firstPlayerLabel():TextField {
			var text:String = "PLAYER 1: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, HEIGHT);
			var position:Point = new Point(SPACING, 0);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function firstPlayerScore():TextField {
			var text:String = "0";
			var format:TextFormat = Components.numberTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(NUMBER_WIDTH, HEIGHT);
			var position:Point = new Point(LABEL_WIDTH + SPACING, 0);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function secondPlayerLabel():TextField {
			var text:String = "PLAYER 2: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, HEIGHT);
			var position:Point = new Point(RECTANGLE_WIDTH + SPACING, 0);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function secondPlayerScore():TextField {
			var text:String = "0";
			var format:TextFormat = Components.numberTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(NUMBER_WIDTH, HEIGHT);
			var position:Point = new Point(RECTANGLE_WIDTH + LABEL_WIDTH + SPACING, 0);
			return Components.textField(text, format, dimensions, position);
		}
	}
}
