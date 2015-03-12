package dotsGame.signals {
	import dotsGame.models.ActiveViews;

	import robotlegs.bender.extensions.contextView.ContextView;

	import flash.display.Sprite;
	
	public class ShowGridCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var grid:Sprite = activeViews.getGrid();
			contextView.view.addChild(grid);
		}
		
	}
}
