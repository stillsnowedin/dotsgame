package dotsGame.signals {
	import dotsGame.models.ActiveViews;
	import dotsGame.models.dataObjects.ViewName;

	import robotlegs.bender.extensions.contextView.ContextView;

	import flash.display.Sprite;

	public class ShowViewCommand {
		
		[Inject]
		public var viewName:ViewName;
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var view:Sprite = activeViews.get(viewName);
			contextView.view.addChild(view);
		}
	}
}
