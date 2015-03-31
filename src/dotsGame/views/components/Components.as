package dotsGame.views.components {
	import fl.controls.ColorPicker;

	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class Components {
		public static const LARGE_TEXT_SIZE:uint = 50;
		public static const MEDIUM_TEXT_SIZE:uint = 30;
		public static const SMALL_TEXT_SIZE:uint = 20;
		public static const TITLE_WIDTH:uint = 800;
		public static const TITLE_HEIGHT:uint = 100;
		public static const HEADER_WIDTH:uint = 375;
		public static const HEADER_HEIGHT:uint = 80;
		public static const LABEL_WIDTH:uint = 200;
		public static const LABEL_HEIGHT:uint = 70;
		public static const INPUT_WIDTH:uint = 100;
		public static const INPUT_HEIGHT:uint = 70;
		public static const BUTTON_WIDTH:uint = 170;
		public static const BUTTON_HEIGHT:uint = 50;
		public static const WHITE:uint = 0xFFFFFF;
		public static const BLACK:uint = 0x000000;
		public static const GRAY:uint = 0xAAAAAA;
		public static const RED:uint = 0xD73B3E;
		public static const BUTTON_COLOR1:uint = 0x229922;
		public static const BUTTON_COLOR2:uint = 0x22ff22;
		public static const BUTTON_COLOR3:uint = 0x55ff22;
		
		public static function title(text:String):TextField {
			var format:TextFormat = titleTextFormat(LARGE_TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(TITLE_WIDTH, TITLE_HEIGHT);
			var position:Point = new Point(0, 0);
			return textField(text, format, dimensions, position);
		}
		
		private static function titleTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("titleFont", size, color, TextFormatAlign.CENTER);
		}
		
		public static function textField(text:String, format:TextFormat, dimensions:Point, position:Point):TextField {
			var textField:TextField = new TextField();
			textField.embedFonts = true;
			textField.defaultTextFormat = format;
			textField.text = text;
			textField.selectable = false;
			textField.width = dimensions.x;
			textField.height = dimensions.y;
			textField.x = position.x;
			textField.y =  position.y + textField.height / 2 - textField.textHeight / 2;
			return textField;
		}
		
		public static function header(text:String):TextField {
			var format:TextFormat = headerTextFormat(MEDIUM_TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(HEADER_WIDTH, HEADER_HEIGHT);
			var position:Point = new Point(0, 0);
			return textField(text, format, dimensions, position);
		}
		
		private static function headerTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("labelFont", size, color, TextFormatAlign.CENTER);
		}
		
		public static function label(text:String, x:Number=0, y:Number=0):TextField {
			var format:TextFormat = labelTextFormat(MEDIUM_TEXT_SIZE, WHITE);
			var dimensions:Point = new Point(LABEL_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(x, y);
			return textField(text, format, dimensions, position);
		}
		
		private static function labelTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("labelFont", size, color, TextFormatAlign.LEFT);
		}
		
		public static function warning(text:String):TextField {
			var format:TextFormat = warningTextFormat(MEDIUM_TEXT_SIZE, RED);
			var dimensions:Point = new Point(TITLE_WIDTH, LABEL_HEIGHT);
			var position:Point = new Point(0, 0);
			return textField(text, format, dimensions, position);
		}
		
		private static function warningTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("labelFont", size, color, TextFormatAlign.CENTER);
		}
		
		public static function inputField(text:String, x:Number=0, y:Number=0, restrictions:String=""):TextField {
			var format:TextFormat = labelTextFormat(SMALL_TEXT_SIZE, BLACK);
			var dimensions:Point = new Point(INPUT_WIDTH, INPUT_HEIGHT);
			var position:Point = new Point(x, y);
			if (restrictions != "")
				return inputTextField(text, format, dimensions, position, restrictions);
			else
				return inputTextField(text, format, dimensions, position); 
		}
		
		public static function inputTextField(text:String, format:TextFormat, dimensions:Point, position:Point, restrictions:String="A-Za-z0-9"):TextField {
			var textField:TextField = new TextField();
			textField.embedFonts = true;
			textField.defaultTextFormat = format;
			textField.text = text;
			textField.type = TextFieldType.INPUT;
			textField.background = true;
			textField.maxChars = 8;
			textField.restrict = restrictions;
			textField.width = dimensions.x;
			textField.height = textField.textHeight;
			textField.x = position.x;
			textField.y =  position.y + dimensions.y / 2 - textField.textHeight / 2;
			return textField;
		}
		
		public static function colorPicker(colors:Array, x:Number=0, y:Number=0):ColorPicker {
			var cp:ColorPicker = new ColorPicker();
			cp.colors = colors;
			cp.selectedColor = colors[0];
			cp.move(x, y);
			return cp;
		}
		
		public static function colorButton(text:String):ColorButton {
			var colorButton:ColorButton = new ColorButton(BUTTON_COLOR1, BUTTON_COLOR2, BUTTON_COLOR3);
			colorButton.setSize(BUTTON_WIDTH, BUTTON_HEIGHT);
			colorButton.setLabel(text, buttonTextFormat(MEDIUM_TEXT_SIZE, WHITE));
			return colorButton;
		}
		
		public static function buttonTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("buttonFont", size, color, TextFormatAlign.CENTER);
		}
		
		public static function numberTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("numberFont", size, color, TextFormatAlign.RIGHT);
		}
		
		private static function textFormat(font:String, size:uint, color:uint, alignment:String):TextFormat {
			var format:TextFormat = new TextFormat();
			format.font = font;
			format.size = size;
			format.color = color;
			format.align = alignment;
			return format;
		}
	}
}
