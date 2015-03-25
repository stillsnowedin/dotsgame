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
			addHeaders();
			addLabels();
			addInputs();
			addButton();
		}
		
		private function setupContainers():void {
			mainContainer.x = stage.stageWidth/2 - BACKGROUND_WIDTH/2;
			mainContainer.y = SPACING;
			titleContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH, Components.TITLE_HEIGHT, 0x000000, 1, 5));
			firstContainer.y = Components.TITLE_HEIGHT + SPACING;
			firstContainer.addChild(BasicShapes.roundRectangle(smallRectWidth(), middleContainerHeight(), 0xCCCCCC, 1, 5));
			secondContainer.x = BACKGROUND_WIDTH/2 + SPACING/2;
			secondContainer.y = Components.TITLE_HEIGHT + SPACING;
			secondContainer.addChild(BasicShapes.roundRectangle(smallRectWidth(), middleContainerHeight(), 0xCCCCCC, 1, 5));
			gridContainer.y = Components.TITLE_HEIGHT + middleContainerHeight() + SPACING*2;
			gridContainer.addChild(BasicShapes.roundRectangle(BACKGROUND_WIDTH, Components.LABEL_HEIGHT, 0xCCCCCC, 1, 5));
		}
		
		private function smallRectWidth():uint {
			return BACKGROUND_WIDTH/2 - SPACING/2;
		}
		
		private function middleContainerHeight():uint {
			return Components.HEADER_HEIGHT + Components.LABEL_HEIGHT*2;
		}
		
		private function addTitle():void {
			titleContainer.addChild(Components.title("The Dots Game"));
		}
		
		private function addHeaders():void {
			firstContainer.addChild(Components.header("FIRST PLAYER"));
			secondContainer.addChild(Components.header("SECOND PLAYER"));
		}
		
		private function addLabels():void {
			firstContainer.addChild(Components.label("Name: ", leftColX(), Components.HEADER_HEIGHT));
			firstContainer.addChild(Components.label("Color: ", leftColX(), Components.HEADER_HEIGHT + Components.LABEL_HEIGHT));
			secondContainer.addChild(Components.label("Name: ", leftColX(), Components.HEADER_HEIGHT));
			secondContainer.addChild(Components.label("Color: ", leftColX(), Components.HEADER_HEIGHT + Components.LABEL_HEIGHT));
			gridContainer.addChild(Components.label("Rows: ", leftColX()));
			gridContainer.addChild(Components.label("x", BACKGROUND_WIDTH/2 - SPACING/2));
			gridContainer.addChild(Components.label("Columns: ", leftColX() + BACKGROUND_WIDTH/2 + SPACING/2));
		}
		
		private function leftColX():Number {
			return SPACING * 2;
		}
		
		private function addInputs():void {
			firstInput = Components.inputField("PLAYER 1", rightColX(), Components.HEADER_HEIGHT);
			firstColorPicker = Components.colorPicker([0xAA0000, 0xAAAA00, 0x00AA00], 
													  rightColX(), 
													  Components.HEADER_HEIGHT + Components.LABEL_HEIGHT + SPACING);
			secondInput = Components.inputField("PLAYER 2", rightColX(), Components.HEADER_HEIGHT);
			secondColorPicker = Components.colorPicker([0x0000AA, 0x00AAAA, 0xAA00AA], 
													   rightColX(), 
													   Components.HEADER_HEIGHT + Components.LABEL_HEIGHT + SPACING);
			gridRowInput = Components.inputField("5", rightColX(), 0, "0-9");
			gridColumnInput = Components.inputField("5", rightColX() + BACKGROUND_WIDTH/2 + SPACING/2, 0, "0-9");
			
			firstContainer.addChild(firstInput);
			firstContainer.addChild(firstColorPicker);
			secondContainer.addChild(secondInput);
			secondContainer.addChild(secondColorPicker);
			gridContainer.addChild(gridRowInput);
			gridContainer.addChild(gridColumnInput);
		}
		
		private function rightColX():Number {
			return Components.LABEL_WIDTH + SPACING;
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
