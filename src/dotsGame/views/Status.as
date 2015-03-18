package dotsGame.views {
	import dotsGame.models.dataObjects.PlayerData;
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
		private static const TEXT_SIZE:uint = 30;
		private var background:Sprite;
		private var textfields:Sprite;
		private var firstScore:TextField;
		private var secondScore:TextField;
		
		public function Status():void {
			background = new Sprite();
			textfields = new Sprite();
			this.addChild(background);
			this.addChild(textfields);
		}
		
		public function init(firstPlayer:PlayerData, secondPlayer:PlayerData, firstScore:uint, secondScore:uint):void {
			drawRectangles(firstPlayer.color, secondPlayer.color);
			createTextFields(firstPlayer.name, firstScore, secondPlayer.name, secondScore);
		}
		
		private function drawRectangles(firstColor:uint, secondColor:uint):void {
			background.addChild(rectangle(0, firstColor));
			background.addChild(rectangle(RECTANGLE_WIDTH, secondColor));
		}
		
		private function rectangle(x:Number, color:uint):Shape {
			var rect:Shape = BasicShapes.createRectangle(RECTANGLE_WIDTH, HEIGHT, color);
			rect.x = x;
			return rect;
		}
		
		private function createTextFields(firstName:String, firstScore:uint, secondName:String, secondScore:uint):void {
			textfields.addChild(label(firstName+": ", SPACING, LABEL_WIDTH));
			textfields.addChild(this.firstScore = label(firstScore.toString(), SPACING + LABEL_WIDTH, NUMBER_WIDTH));
			textfields.addChild(label(secondName+": ", SPACING + RECTANGLE_WIDTH, LABEL_WIDTH));
			textfields.addChild(this.secondScore = label(secondScore.toString(), SPACING + RECTANGLE_WIDTH + LABEL_WIDTH, NUMBER_WIDTH));
		}
		
		private function label(text:String, x:Number, width:Number):TextField {
			var format:TextFormat = Components.labelTextFormat(TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(width, HEIGHT);
			var position:Point = new Point(x, 0);
			return Components.textField(text, format, dimensions, position);
		}
		
		public function updateFirstScore(score:uint):void {
			firstScore.text = score.toString();
		}
		
		public function updateSecondScore(score:uint):void {
			secondScore.text = score.toString();
		}
	}
}
