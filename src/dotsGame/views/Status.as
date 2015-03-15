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
		private static const WHITE:uint = 0xFFFFFF;
		private static const RED:uint = 0xCC1111;
		private static const BLUE:uint = 0x1177CC;
		private static const TEXT_SIZE:uint = 30;
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
			background.addChild(rectangle(0, RED));
			background.addChild(rectangle(RECTANGLE_WIDTH, BLUE));
		}
		
		private function rectangle(x:Number, color:uint):Shape {
			var rect:Shape = BasicShapes.createRectangle(RECTANGLE_WIDTH, HEIGHT, color);
			rect.x = x;
			return rect;
		}
		
		private function createTextFields():void {
			textfields.addChild(label("PLAYER 1: ", SPACING, LABEL_WIDTH));
			textfields.addChild(label("0", SPACING + LABEL_WIDTH, NUMBER_WIDTH));
			textfields.addChild(label("PLAYER 2: ", SPACING + RECTANGLE_WIDTH, LABEL_WIDTH));
			textfields.addChild(label("0", SPACING + RECTANGLE_WIDTH + LABEL_WIDTH, NUMBER_WIDTH));
		}
		
		private function label(text:String, x:Number, width:Number):TextField {
			var format:TextFormat = Components.labelTextFormat(TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(width, HEIGHT);
			var position:Point = new Point(x, 0);
			return Components.textField(text, format, dimensions, position);
		}
	}
}
