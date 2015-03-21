package dotsGame.views {
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.ColorButton;
	import dotsGame.views.components.Components;

	import fl.controls.ColorPicker;

	import org.osflash.signals.Signal;

	import flash.display.Sprite;
	import flash.text.TextField;

	public class Specs extends Sprite {
		private static const BACKGROUND_WIDTH:uint = 800;
		private static const Y_OFFSET:uint = 100;
		private static const SPACING:uint = 25;
		private var mainContainer:Sprite;
		private var titleContainer:Sprite;
		private var firstContainer:Sprite;
		private var secondContainer:Sprite;
		private var gridContainer:Sprite;
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
			mainContainer = new Sprite();
			titleContainer = new Sprite();
			firstContainer = new Sprite();
			secondContainer = new Sprite();
			gridContainer = new Sprite();
			this.addChild(mainContainer);
			mainContainer.addChild(titleContainer);
			mainContainer.addChild(firstContainer);
			mainContainer.addChild(secondContainer);
			mainContainer.addChild(gridContainer);
		}
		
		public function init():void {
			setupContainers();
			addTitle();
			addLabels();
			addInputs();
			addButton();
		}
		
		private function setupContainers():void {
			mainContainer.x = stage.stageWidth/2 - BACKGROUND_WIDTH/2;
			mainContainer.y = SPACING;
			titleContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH, Y_OFFSET, 0xCCCCCC, 1, 5));
			firstContainer.y = Y_OFFSET + SPACING;
			firstContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH/2 - SPACING/2, Y_OFFSET*2 + SPACING*2, 0xCCCCCC, 1, 5));
			secondContainer.x = BACKGROUND_WIDTH/2 + SPACING/2;
			secondContainer.y = Y_OFFSET + SPACING;
			secondContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH/2 - SPACING/2, Y_OFFSET*2 + SPACING*2, 0xCCCCCC, 1, 5));
			gridContainer.y = Y_OFFSET*3 + SPACING*4;
			gridContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH, Y_OFFSET, 0xCCCCCC, 1, 5));
		}
		
		private function addTitle():void {
			titleContainer.addChild(Components.title("The Dot Game"));
		}
		
		private function addLabels():void {
			firstContainer.addChild(Components.label("FIRST PLAYER", 0));
			firstContainer.addChild(Components.label("Name: ", Components.LABEL_HEIGHT));
			firstContainer.addChild(Components.label("Color: ", Components.LABEL_HEIGHT*2));
			secondContainer.addChild(Components.label("SECOND PLAYER", 0));
			secondContainer.addChild(Components.label("Name: ", Components.LABEL_HEIGHT));
			secondContainer.addChild(Components.label("Color: ", Components.LABEL_HEIGHT*2));
			gridContainer.addChild(Components.label("GRID SIZE: ", 0));
		}
		
		private function addInputs():void {
			firstInput = Components.inputField("PLAYER 1", Components.LABEL_WIDTH, Components.LABEL_HEIGHT);
			firstColorPicker = Components.colorPicker([0xFF0000, 0xFFFF00, 0x00FF00], Components.LABEL_HEIGHT*2 + SPACING);
			secondInput = Components.inputField("PLAYER 2", Components.LABEL_WIDTH, Components.LABEL_HEIGHT);
			secondColorPicker = Components.colorPicker([0x00FFFF, 0x0000FF, 0xFF00FF], Components.LABEL_HEIGHT*2 + SPACING);
			gridRowInput = Components.inputField("5", Components.LABEL_WIDTH, 0, "0-9");
			gridColumnInput = Components.inputField("5", Components.LABEL_WIDTH + Components.INPUT_WIDTH + SPACING, 0, "0-9");
			
			firstContainer.addChild(firstInput);
			firstContainer.addChild(firstColorPicker);
			secondContainer.addChild(secondInput);
			secondContainer.addChild(secondColorPicker);
			gridContainer.addChild(gridRowInput);
			gridContainer.addChild(gridColumnInput);
		}
		
		private function addButton():void {
			var playButton:ColorButton = Components.colorButton("PLAY");
			playButton.x = stage.stageWidth/2 - playButton.width/2;
			playButton.y = stage.stageHeight - Y_OFFSET - SPACING;
			playButton.clicked.add(onPlay);
			this.addChild(playButton);
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
