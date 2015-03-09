package dotsGame.views.components {
	import flash.display.Shape;

	public class BasicShapes {

		public static function createRectangle(width:Number, height:Number, color:uint, alpha:Number=1):Shape {
			var rectangle:Shape = new Shape();
			rectangle.graphics.beginFill(color, alpha);
			rectangle.graphics.drawRect(0, 0, width, height);
			rectangle.graphics.endFill();
			return rectangle;
		}
		
		public static function createRoundRectangle(width:Number, height:Number, color:uint, alpha:Number=1, 
													ellipseWidth:Number=10, ellipseHeight:Number=undefined):Shape {
			var roundRectangle:Shape = new Shape();
			roundRectangle.graphics.beginFill(color, alpha);
			roundRectangle.graphics.drawRoundRect(0, 0, width, height, ellipseWidth, ellipseHeight);
			roundRectangle.graphics.endFill();
			return roundRectangle;
		}

		public static function createCircle(radius:Number, color:uint, alpha:Number=1):Shape {
			var circle:Shape = new Shape();
			circle.graphics.beginFill(color, alpha);
			circle.graphics.drawCircle(0, 0, radius);
			circle.graphics.endFill();
			return circle;
		}
	}
}
