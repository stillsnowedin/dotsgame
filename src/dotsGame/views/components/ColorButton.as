package dotsGame.views.components {
	import flash.events.Event;
	
	public class ColorButton extends Button {
		protected var upColor:uint;
		protected var overColor:uint;
		protected var downColor:uint;
		
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
		
		protected function createBackgrounds():void {
			up = BasicShapes.createRoundRectangle(bgWidth, bgHeight, upColor);
			over = BasicShapes.createRoundRectangle(bgWidth, bgHeight, overColor);
			down = BasicShapes.createRoundRectangle(bgWidth, bgHeight, downColor);
		}
	}
}
