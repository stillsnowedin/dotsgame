package dotsGame.signals {
	import robotlegs.bender.extensions.contextView.ContextView;

	import dotsGame.models.ActiveViews;

	import flash.display.Sprite;

	public class ShowMenuCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var menu:Sprite = activeViews.getMenu();
			contextView.view.addChild(menu);
		}
	}
}
