package dotsGame.views.components {
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class Components {
		
		public static function colorButton(upColor:uint, overColor:uint, downColor:uint, 
										   dimensions:Point, position:Point):ColorButton {
			var colorButton:ColorButton = new ColorButton(upColor, overColor, downColor);
			colorButton.setSize(dimensions.x, dimensions.y);
			colorButton.x = position.x;
			colorButton.y = position.y;
			return colorButton;
		}
		
		public static function rectangleButton(upColor:uint, overColor:uint, downColor:uint, 
										   	   dimensions:Point, position:Point):RectangleButton {
			var rectangleButton:RectangleButton = new RectangleButton(upColor, overColor, downColor);
			rectangleButton.setSize(dimensions.x, dimensions.y);
			rectangleButton.x = position.x;
			rectangleButton.y = position.y;
			return rectangleButton;
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
		
		public static function inputTextField(text:String, format:TextFormat, dimensions:Point, position:Point):TextField {
			var textField:TextField = new TextField();
			textField.embedFonts = true;
			textField.defaultTextFormat = format;
			textField.text = text;
			textField.type = TextFieldType.INPUT;
			textField.background = true;
			textField.width = dimensions.x;
			textField.height = textField.textHeight;
			textField.x = position.x;
			textField.y =  position.y + dimensions.y / 2 - textField.textHeight / 2;
			return textField;
		}
		
		public static function buttonTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("buttonFont", size, color, TextFormatAlign.CENTER);
		}
		
		public static function labelTextFormat(size:uint, color:uint):TextFormat {
			return textFormat("labelFont", size, color, TextFormatAlign.LEFT);
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
