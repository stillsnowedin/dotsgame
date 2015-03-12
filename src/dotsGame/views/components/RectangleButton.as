package dotsGame.views.components {

	public class RectangleButton extends ColorButton {
		
		public function RectangleButton(upColor:uint, overColor:uint, downColor:uint):void {
			super(upColor, overColor, downColor);
		}
		
		override protected function createBackgrounds():void {
			up = BasicShapes.createRectangle(bgWidth, bgHeight, upColor);
			over = BasicShapes.createRectangle(bgWidth, bgHeight, overColor);
			down = BasicShapes.createRectangle(bgWidth, bgHeight, downColor);
		}
	}
}
