package dotsGame.signals {
	import dotsGame.models.ActiveViews;

	import robotlegs.bender.extensions.contextView.ContextView;

	import flash.display.Sprite;
	public class ShowSpecsCommand {
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var specs:Sprite = activeViews.getSpecs();
			contextView.view.addChild(specs);
		}
	}
}
