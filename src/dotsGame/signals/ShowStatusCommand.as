package dotsGame.signals {
	import robotlegs.bender.extensions.contextView.ContextView;

	import dotsGame.models.ActiveViews;

	import flash.display.Sprite;

	public class ShowStatusCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var status:Sprite = activeViews.getStatus();
			contextView.view.addChild(status);
		}
	}
}
