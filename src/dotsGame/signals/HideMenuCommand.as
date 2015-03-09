package dotsGame.signals {
	import robotlegs.bender.extensions.contextView.ContextView;

	import dotsGame.models.ActiveViews;

	import flash.display.Sprite;

	public class HideMenuCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var menu:Sprite = activeViews.getMenu();
			if (contextView.view.contains(menu))
				contextView.view.removeChild(menu);
		}
	}
}
