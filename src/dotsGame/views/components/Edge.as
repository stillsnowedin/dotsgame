package dotsGame.views.components {
	import org.osflash.signals.Signal;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	
	public class Edge extends Sprite {
		private var _highlighted:Signal;
		private var _clicked:Signal;
		private var _index:uint;
		private var _eliminated:Boolean;
		private var defaultColor:uint;
		private var rectangle:Shape;
		
		public function Edge(index:uint, color:uint, width:uint, height:uint):void {
			_highlighted = new Signal(uint);
			_clicked = new Signal(uint);
			_index = index;
			_eliminated = false;
			defaultColor = color;
			drawRectangle(width, height, color);
			addListeners();
		}
		
		private function drawRectangle(width:uint, height:uint, color:uint):void {
			rectangle = BasicShapes.rectangle(width, height, color);
			this.addChild(rectangle);
		}
		
		private function addListeners():void {
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
			this.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOut);
		}
		
		private function onMouseClick(me:MouseEvent):void {
			removeListeners();
			_eliminated = true;
			_clicked.dispatch(_index);
		}
		
		private function removeListeners():void {
			this.removeEventListener(MouseEvent.CLICK, onMouseClick);
			this.removeEventListener(MouseEvent.ROLL_OVER, onMouseRollOver);
			this.removeEventListener(MouseEvent.ROLL_OUT, onMouseRollOut);
		}
		
		private function onMouseRollOver(me:MouseEvent):void {
			_highlighted.dispatch(_index);
		}
		
		private function onMouseRollOut(me:MouseEvent):void {
			changeColor(defaultColor);
		}
		
		public function changeColor(color:uint):void {
			var trans:ColorTransform = rectangle.transform.colorTransform;
			trans.color = color;
			rectangle.transform.colorTransform = trans;
		}
		
		public function isVertical():Boolean {
			return this.width < this.height;
		}
		
		public function get highlighted():Signal {
			return _highlighted;
		}
		
		public function get clicked():Signal {
			return _clicked;
		}
		
		public function get index():uint {
			return _index;
		}
		
		public function get eliminated():Boolean {
			return _eliminated;
		}
	}
}
