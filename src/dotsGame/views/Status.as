package dotsGame.views {
	import dotsGame.models.dataObjects.PlayerData;
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Components;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.text.TextField;

	public class Status extends Sprite {
		private static const SPACING:Number = 150;
		private var rectangleWidth:uint;
		private var rectangleHeight:uint = 100;
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
			rectangleWidth = stage.stageWidth/2;
			drawRectangles(firstPlayer.color, secondPlayer.color);
			addLabels(firstPlayer.name, firstScore, secondPlayer.name, secondScore);
		}
		
		private function drawRectangles(firstColor:uint, secondColor:uint):void {
			background.addChild(rectangle(0, firstColor));
			background.addChild(rectangle(rectangleWidth, secondColor));
		}
		
		private function rectangle(x:Number, color:uint):Shape {
			var rect:Shape = BasicShapes.rectangle(rectangleWidth, rectangleHeight, color);
			rect.x = x;
			return rect;
		}
		
		private function addLabels(firstName:String, firstScore:uint, secondName:String, secondScore:uint):void {
			var labelY:uint = (rectangleHeight - Components.LABEL_HEIGHT)/2;
			this.firstScore = Components.label(firstScore.toString(), labelY, SPACING + Components.LABEL_WIDTH);
			this.secondScore = Components.label(secondScore.toString(), labelY, SPACING + rectangleWidth + Components.LABEL_WIDTH);
			
			textfields.addChild(Components.label(firstName+": ", labelY, SPACING));
			textfields.addChild(this.firstScore);
			textfields.addChild(Components.label(secondName+": ", labelY, SPACING + rectangleWidth));
			textfields.addChild(this.secondScore);
		}
		
		public function updateFirstScore(score:uint):void {
			firstScore.text = score.toString();
		}
		
		public function updateSecondScore(score:uint):void {
			secondScore.text = score.toString();
		}
	}
}
