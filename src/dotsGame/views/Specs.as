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
		private static const BUTTON_SIZE:Point = new Point(170, 50);
		private var firstInput:TextField;
		private var secondInput:TextField;
		private var firstColorPicker:ColorPicker;
		private var secondColorPicker:ColorPicker;
		private var gridRowInput:TextField;
		private var gridColumnInput:TextField;
		public var playGame:Signal;
		public var invalidInput:Signal;
		public var firstName:String;
		public var secondName:String;
		public var firstColor:uint;
		public var secondColor:uint;
		public var gridRows:uint;
		public var gridColumns:uint;
		public var warning:String;
		
		
		public function Specs():void {
			playGame = new Signal();
			invalidInput = new Signal();
		}
		
		public function init():void {
			addLabels();
			addInputs();
			addButton();
		}
		
		private function addLabels():void {
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
		
		private function addInputs():void {
			this.addChild(firstInput = inputField("PLAYER 1", LABEL_X + LABEL_WIDTH, Y_OFFSET));
			this.addChild(firstColorPicker = colorPicker([0xFF0000, 0xFFFF00, 0x00FF00], Y_OFFSET + LABEL_HEIGHT));
			this.addChild(secondInput = inputField("PLAYER 2", LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 2 + SPACING));
			this.addChild(secondColorPicker = colorPicker([0x00FFFF, 0x0000FF, 0xFF00FF], Y_OFFSET + LABEL_HEIGHT * 3 + SPACING));
			this.addChild(gridRowInput = inputField("5", LABEL_X + LABEL_WIDTH, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2, "0-9"));
			this.addChild(gridColumnInput = inputField("5", LABEL_X + LABEL_WIDTH + INPUT_WIDTH + SPACING, Y_OFFSET + LABEL_HEIGHT * 4 + SPACING * 2, "0-9"));
		}
		
		private function inputField(text:String, x:Number, y:Number, restrictions:String=""):TextField {
			var format:TextFormat = Components.labelTextFormat(INPUT_TEXT_SIZE, BLACK);
			var dimensions:Point = new Point(INPUT_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(x, y);
			if (restrictions != "")
				return Components.inputTextField(text, format, dimensions, position, restrictions);
			else
				return Components.inputTextField(text, format, dimensions, position); 
		}
		
		private function colorPicker(colors:Array, y:Number):ColorPicker {
			var cp:ColorPicker = new ColorPicker();
			cp.colors = colors;
			cp.selectedColor = colors[0];
			cp.move(LABEL_X + LABEL_WIDTH, y);
			return cp;
		}
		
		private function addButton():void {
			var playButton:ColorButton = colorButton("PLAY", 
													  stage.stageWidth/2 - BUTTON_SIZE.x/2, 
													  Y_OFFSET + LABEL_HEIGHT * 5 + SPACING * 3);
			playButton.clicked.add(onPlay);
			this.addChild(playButton);
		}
		
		private function colorButton(label:String, x:Number, y:Number):ColorButton {
			var position:Point = new Point(x,y);
			var button:ColorButton = Components.colorButton(0x229922, 0x22ff22, 0x55ff22, 
													   		BUTTON_SIZE, 
													   		position);
			var format:TextFormat = Components.buttonTextFormat(30, 0xFFFFFF);
			button.setLabel(label, format);
			return button;
		}
		
		private function onPlay():void {
			if (validateInput())
				playGame.dispatch();
			else
				invalidInput.dispatch();
		}
		
		private function validateInput():Boolean {
			getInput();
			var valid:Boolean = validNames() && validGrid();
			return valid;
		}
		
		private function getInput():void {
			firstName = firstInput.text;
			secondName = secondInput.text;
			firstColor = firstColorPicker.selectedColor;
			secondColor = secondColorPicker.selectedColor;
			gridRows = (uint)(gridRowInput.text);
			gridColumns = (uint)(gridColumnInput.text);
		}
		
		private function validNames():Boolean {
			if (firstName == "" || secondName == "") {
				warning = "Names cannot be blank.";
				return false;
			}
			return true;
		}
		
		private function validGrid():Boolean {
			if ((gridRows < 1 || gridRows > 100) ||
				(gridColumns < 1 || gridColumns > 100)) {
				warning = "Grid size must be between 1 and 100.";
				return false;
			}
			return true;
		}
	}
}
