package dotsGame {

	public class Utils {
		
		public static function brighten(hexColor:Number, percent:Number):Number{
            var factor:Number = validPercent(percent)/100;
			var rgb:Object = hexToRgb(hexColor);
			rgb.r += (255 - rgb.r) * factor;
            rgb.g += (255 - rgb.g) * factor;
			rgb.b += (255 - rgb.b) * factor;
			return rgbToHex(Math.round(rgb.r), Math.round(rgb.g), Math.round(rgb.b));
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
		
		private static function hexToRgb (hex:Number):Object{
            return {r:(hex & 0xff0000) >> 16,
					g:(hex & 0x00ff00) >> 8,
					b:(hex & 0x0000ff)};
        }
		
		private static function rgbToHex(r:Number, g:Number, b:Number):Number {
                return (r<<16 | g<<8 | b);
        }
		
		public static function darken(hexColor:Number, percent:Number):Number {
            var factor:Number = validPercent(percent)/100;
			var rgb:Object = hexToRgb(hexColor);
			rgb.r *= factor;
			rgb.g *= factor;
			rgb.b *= factor;
			return rgbToHex(Math.round(rgb.r), Math.round(rgb.g), Math.round(rgb.b));
		}
		
		public static function combine(hex1:Number, hex2:Number):Number {
			var rgb1:Object = hexToRgb(hex1);
			var rgb2:Object = hexToRgb(hex2);
			return rgbToHex(Math.round((rgb1.r+rgb2.r)/2), Math.round((rgb1.g+rgb2.g)/2), Math.round((rgb1.b+rgb2.b)/2));
		}
	}
}
