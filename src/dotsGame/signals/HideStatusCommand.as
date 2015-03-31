package dotsGame.signals {
	import dotsGame.models.ActiveViews;
	import robotlegs.bender.extensions.contextView.ContextView;
	import flash.display.Sprite;
	
	public class HideStatusCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var status:Sprite = activeViews.getStatus();
			if (contextView.view.contains(status))
				contextView.view.removeChild(status);
		}
	}
}
