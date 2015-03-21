package dotsGame.views.components {
	import org.osflash.signals.Signal;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	public class Edge extends Sprite {
		private var _highlighted:Signal;
		private var _clicked:Signal;
		private var _index:uint;
		private var _eliminated:Boolean;
		private var defaultColor:uint;
		private var rectangle:Shape;
		
		public function Edge(index:uint, color:uint, dimensions:Point):void {
			_highlighted = new Signal(uint);
			_clicked = new Signal(uint);
			_index = index;
			_eliminated = false;
			defaultColor = color;
			drawRectangle(color, dimensions);
			addListeners();
		}
		
		private function drawRectangle(color:uint, dimensions:Point):void {
			rectangle = BasicShapes.rectangle(dimensions.x, dimensions.y, color);
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
			trans.color = uint(color);
			rectangle.transform.colorTransform = trans;
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
