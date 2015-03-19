package dotsGame.signals {
	import dotsGame.models.Layout;
	
	public class SwapColorCommand {
		
		[Inject]
		public var layout:Layout;
		
		public function execute():void {
			layout.swapColor();
		}
	}
}
