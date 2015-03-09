package dotsGame.views.components {
	import flash.events.Event;
	import flash.geom.Point;
	
	public class ColorButton extends Button {
		private var upColor:uint;
		private var overColor:uint;
		private var downColor:uint;
		
		public function ColorButton(upColor:uint, overColor:uint, downColor:uint):void {
			this.upColor = upColor;
			this.overColor = overColor;
			this.downColor = downColor;
			this.addEventListener(Event.ENTER_FRAME, init);
		}
		
		private function init(e:Event):void {
			this.removeEventListener(Event.ENTER_FRAME, init);
			createBackgrounds();
			addBackgrounds();
			setBackgroundTo(up);
		}
		
		private function createBackgrounds():void {
			up = BasicShapes.createRoundRectangle(bgWidth, bgHeight, upColor);
			over = BasicShapes.createRoundRectangle(bgWidth, bgHeight, overColor);
			down = BasicShapes.createRoundRectangle(bgWidth, bgHeight, downColor);
		}
	}
}
