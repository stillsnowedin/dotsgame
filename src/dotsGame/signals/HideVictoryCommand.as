package dotsGame.signals {
	import dotsGame.models.ActiveViews;

	import robotlegs.bender.extensions.contextView.ContextView;

	import flash.display.Sprite;
	
	public class HideVictoryCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var victory:Sprite = activeViews.getVictory();
			if (contextView.view.contains(victory))
				contextView.view.removeChild(victory);
		}
	}
}
