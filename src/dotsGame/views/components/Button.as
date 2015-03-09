package dotsGame.views.components {
	import org.osflash.signals.Signal;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Button extends Sprite {
		private var _clicked:Signal;
		private var background:Sprite;
		private var label:Sprite;
		protected var up:DisplayObject;
		protected var over:DisplayObject;
		protected var down:DisplayObject;
		protected var bgWidth:Number;
		protected var bgHeight:Number;
		
		public function Button():void {
			_clicked = new Signal();
			background = new Sprite();
			label = new Sprite();
			this.addChild(background);
			this.addChild(label);
			addEventListeners();
		}
		
		private function addEventListeners():void {
			this.addEventListener(MouseEvent.ROLL_OVER, onMouseRollOver);
			this.addEventListener(MouseEvent.ROLL_OUT, onMouseRollOut);
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.addEventListener(MouseEvent.CLICK, onMouseClick);
		}
		
		private function onMouseRollOver(me:MouseEvent):void {
			setBackgroundTo(over);
		}
		
		private function onMouseRollOut(me:MouseEvent):void {
			setBackgroundTo(up);
		}
		
		private function onMouseDown(me:MouseEvent):void {
			setBackgroundTo(down);
		}
		
		private function onMouseUp(me:MouseEvent):void {
			setBackgroundTo(up);
		}
		
		private function onMouseClick(me:MouseEvent):void {
			_clicked.dispatch();
		}
		
		protected function setBackgroundTo(desiredBg:DisplayObject):void {
			for (var i:int=0; i<background.numChildren; i++) {
				var bg:DisplayObject = background.getChildAt(i) as DisplayObject;
				bg.visible = (bg == desiredBg);
			}
		}
		
		protected function addBackgrounds():void {
			background.addChild(up);
			background.addChild(over);
			background.addChild(down);
		}
		
		public function setLabel(text:String, format:TextFormat):void {
			var dimensions:Point = new Point(bgWidth, bgHeight);
			var position:Point = new Point(0,0);
			var textField:TextField = Components.textField(text, format, dimensions, position);
			label.addChild(textField);
		}
		
		public function setSize(bgWidth:Number, bgHeight:Number):void {
			this.bgWidth = bgWidth;
			this.bgHeight = bgHeight;
		}
		
		public function get clicked():Signal {
			return _clicked;
		}
	}
}
