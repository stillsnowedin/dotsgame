package dotsGame {

	public class FontConfig {
		
		[Embed(source="../fonts/Nobile/Nobile-Regular.ttf", 
			fontName="buttonFont", 
			fontFamily="buttonFamily",
    		mimeType ="application/x-font-truetype", 
    		fontWeight="normal", 
    		fontStyle="normal", 
    		unicodeRange="U+0020,U+0041-005A,U+0061-007A", 
    		advancedAntiAliasing="true", 
    		embedAsCFF="false")]
		private static var buttonFont:Class;
			
		[Embed(source="../fonts/Nobile/Nobile-Medium.ttf", 
			fontName="labelFont", 
			fontFamily="labelFamily",
    		mimeType ="application/x-font-truetype", 
    		fontWeight="normal", 
    		fontStyle="normal", 
    		unicodeRange="U+0020-0060,U+007B-007E", 
    		advancedAntiAliasing="true", 
    		embedAsCFF="false")]
		private static var labelFont:Class;
			
		[Embed(source="../fonts/Nobile/Nobile-Bold.ttf", 
			fontName="numberFont", 
			fontFamily="numberFamily",
    		mimeType ="application/x-font-truetype", 
    		fontWeight="normal", 
    		fontStyle="normal", 
    		unicodeRange="U+002E,U+0030-0039", 
    		advancedAntiAliasing="true", 
    		embedAsCFF="false")]
		private static var numberFont:Class;
	}
}
