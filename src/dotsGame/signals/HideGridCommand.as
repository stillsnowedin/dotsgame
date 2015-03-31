package dotsGame.signals {

	import dotsGame.models.ActiveViews;
	import robotlegs.bender.extensions.contextView.ContextView;
	import flash.display.Sprite;
	
	public class HideGridCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var grid:Sprite = activeViews.getGrid();
			if (contextView.view.contains(grid))
				contextView.view.removeChild(grid);
		}
	}
}
