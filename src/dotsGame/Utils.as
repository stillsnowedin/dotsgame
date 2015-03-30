package dotsGame {

	public class Utils {
		
		public static function brighten(hexColor:Number, percent:Number):Number{
            var factor:Number = validPercent(percent)/100;
			return shiftColor(hexColor, factor);
        }
		
		private static function validPercent(percent:Number):Number {
			if (isNaN(percent))
                return 0;
            if (percent > 100)
                return 100;
            if (percent < 0)
                return 0;
			return percent;
		}
		
		private static function shiftColor(hexColor:Number, factor:Number):Number {
			var rgb:Object = hexToRgb(hexColor);
			rgb.r += rgb.r * factor; //rgb.r + 255 * factor - rgb.r * factor
            rgb.g += rgb.g * factor;
			rgb.b += rgb.b * factor;
            return rgbToHex(Math.round(rgb.r), Math.round(rgb.g), Math.round(rgb.b));
		}
		
		private static function hexToRgb (hex:Number):Object{
            return {r:(hex & 0xff0000) >> 16,
					g:(hex & 0x00ff00) >> 8,
					b:(hex & 0x0000ff)};
        }
		
		private static function rgbToHex(r:Number, g:Number, b:Number):Number {
                return (r<<16 | g<<8 | b);
        }
		
		public static function darken(hexColor:Number, percent:Number):Number {
            var factor:Number = 0 - validPercent(percent)/100;
            return shiftColor(hexColor, factor);
		}
	}
}
