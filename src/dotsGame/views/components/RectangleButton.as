package dotsGame.views.components {

	public class RectangleButton extends ColorButton {
		
		public function RectangleButton(upColor:uint, overColor:uint, downColor:uint):void {
			super(upColor, overColor, downColor);
		}
		
		override protected function createBackgrounds():void {
			up = BasicShapes.rectangle(bgWidth, bgHeight, upColor);
			over = BasicShapes.rectangle(bgWidth, bgHeight, overColor);
			down = BasicShapes.rectangle(bgWidth, bgHeight, downColor);
		}
	}
}
