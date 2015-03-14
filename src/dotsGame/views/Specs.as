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
			this.addChild(firstPlayerName());
			this.addChild(firstPlayerColor());
			this.addChild(secondPlayerName());
			this.addChild(secondPlayerColor());
			this.addChild(gridSize());
		}
		
		private function firstPlayerName():TextField {
			var text:String = "PLAYER 1 NAME: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, Y_OFFSET);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function firstPlayerColor():TextField {
			var text:String = "PLAYER 1 COLOR: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, Y_OFFSET + LABEL_HEIGHT);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function secondPlayerName():TextField {
			var text:String = "PLAYER 2 NAME: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, Y_OFFSET + LABEL_HEIGHT * 2 + SPACING);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function secondPlayerColor():TextField {
			var text:String = "PLAYER 2 COLOR: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, Y_OFFSET + LABEL_HEIGHT * 3 + SPACING);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function gridSize():TextField {
			var text:String = "GRID SIZE: ";
			var format:TextFormat = Components.labelTextFormat(30, 0xFFFFFF);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2);
			return Components.textField(text, format, dimensions, position);
		}
		
		private function createInputs():void {
			this.addChild(firstNameInput());
			this.addChild(firstColorPicker());
			this.addChild(secondNameInput());
			this.addChild(secondColorPicker());
			this.addChild(rowInput());
			this.addChild(columnInput());
		}
		
		private function firstNameInput():TextField {
			var text:String = "PLAYER 1";
			var format:TextFormat = Components.labelTextFormat(20, 0x000000);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X + LABEL_WIDTH, Y_OFFSET);
			return Components.inputTextField(text, format, dimensions, position);
		}
		
		private function firstColorPicker():ColorPicker {
			var colorPicker:ColorPicker = new ColorPicker();
			colorPicker.colors = [0xFF0000, 0xFFFF00, 0x00FF00, 0x00FFFF, 0x0000FF, 0xFF00FF];
			colorPicker.move(LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT);
			return colorPicker;
		}
		
		private function secondNameInput():TextField {
			var text:String = "PLAYER 2";
			var format:TextFormat = Components.labelTextFormat(20, 0x000000);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 2 + SPACING);
			return Components.inputTextField(text, format, dimensions, position);
		}
		
		private function secondColorPicker():ColorPicker {
			var colorPicker:ColorPicker = new ColorPicker();
			colorPicker.colors = [0xFF0000, 0xFFFF00, 0x00FF00, 0x00FFFF, 0x0000FF, 0xFF00FF];
			colorPicker.move(LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 3 + SPACING);
			return colorPicker;
		}
		
		private function rowInput():TextField {
			var text:String = "5";
			var format:TextFormat = Components.labelTextFormat(20, 0x000000);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2);
			return Components.inputTextField(text, format, dimensions, position);
		}
		
		private function columnInput():TextField {
			var text:String = "5";
			var format:TextFormat = Components.labelTextFormat(20, 0x000000);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(LABEL_X + LABEL_WIDTH + INPUT_WIDTH + SPACING, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2);
			return Components.inputTextField(text, format, dimensions, position);
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
