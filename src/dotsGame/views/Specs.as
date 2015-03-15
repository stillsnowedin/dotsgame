package dotsGame.views {
	import dotsGame.views.components.ColorButton;
	import dotsGame.views.components.Components;

	import fl.controls.ColorPicker;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;

	public class Specs extends Sprite {
		private static const LABEL_X:uint = 200;
		private static const LABEL_HEIGHT:uint = 70;
		private static const LABEL_WIDTH:uint = 300;
		private static const INPUT_WIDTH:uint = 150;
		private static const Y_OFFSET:uint = 100;
		private static const SPACING:uint = 50;
		private static const LABEL_TEXT_SIZE:uint = 30;
		private static const INPUT_TEXT_SIZE:uint = 20;
		private static const WHITE:uint = 0xFFFFFF;
		private static const BLACK:uint = 0x000000;
		
		public var playGame:Signal;
		
		public function Specs():void {
			playGame = new Signal();
		}
		
		public function init():void {
			createLabels();
			createInputs();
			createButton();
		}
		
		private function createLabels():void {
			this.addChild(label("PLAYER 1 NAME: ", Y_OFFSET));
			this.addChild(label("PLAYER 1 COLOR: ", Y_OFFSET + LABEL_HEIGHT));
			this.addChild(label("PLAYER 2 NAME: ", Y_OFFSET + LABEL_HEIGHT * 2 + SPACING));
			this.addChild(label("PLAYER 2 COLOR: ", Y_OFFSET + LABEL_HEIGHT * 3 + SPACING));
			this.addChild(label("GRID SIZE: ", Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2));
		}
		
		private function label(text:String, y:Number):TextField {
			var format:TextFormat = Components.labelTextFormat(LABEL_TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, y);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function createInputs():void {
			this.addChild(inputField("PLAYER 1", LABEL_X + LABEL_WIDTH, Y_OFFSET));
			this.addChild(colorPicker([0xFF0000, 0xFFFF00, 0x00FF00], Y_OFFSET + LABEL_HEIGHT));
			this.addChild(inputField("PLAYER 2", LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 2 + SPACING));
			this.addChild(colorPicker([0x00FFFF, 0x0000FF, 0xFF00FF], Y_OFFSET + LABEL_HEIGHT * 3 + SPACING));
			this.addChild(inputField("5", LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2));
			this.addChild(inputField("5", LABEL_X + LABEL_WIDTH + INPUT_WIDTH + SPACING, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2));
		}
		
		private function inputField(text:String, x:Number, y:Number):TextField {
			var format:TextFormat = Components.labelTextFormat(INPUT_TEXT_SIZE, BLACK);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(x, y);
			return Components.inputTextField(text, format, dimensions, position);
		}
		
		private function colorPicker(colors:Array, y:Number):ColorPicker {
			var cp:ColorPicker = new ColorPicker();
			cp.colors = colors;
			cp.move(LABEL_X + LABEL_WIDTH, y);
			cp.selectedColor = colors[0];
			return cp;
		}
		
		private function createButton():void {
			var dimensions:Point = new Point(120, 50);
			var position:Point = new Point();
			position.x = stage.stageWidth/2 - dimensions.x/2; 
			position.y = Y_OFFSET + LABEL_HEIGHT * 5 + SPACING * 3;
			var buttonFormat:TextFormat = Components.buttonTextFormat(30, 0xFFFFFF);
			var button:ColorButton = Components.colorButton(0x229922, 0x22ff22, 0x55ff22, 
													   		dimensions, 
													   		position);
			button.setLabel("PLAY", buttonFormat);
			button.clicked.add(onPlay);
			this.addChild(button);
		}
		
		private function onPlay():void {
			playGame.dispatch();
		}
	}
}
