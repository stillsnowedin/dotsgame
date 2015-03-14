package dotsGame.signals {
	import dotsGame.models.ActiveViews;

	import robotlegs.bender.extensions.contextView.ContextView;

	import flash.display.Sprite;

	public class HideSpecsCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var specs:Sprite = activeViews.getSpecs();
			if (contextView.view.contains(specs))
				contextView.view.removeChild(specs);
		}
	}
}
