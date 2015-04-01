package dotsGame.signals {
	import dotsGame.models.ActiveViews;
	import dotsGame.models.dataObjects.ViewName;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import flash.display.Sprite;
	
	public class HideViewCommand {
		
		[Inject]
		public var viewName:ViewName;
		
		[Inject]
		public var activeViews:ActiveViews;
		
		[Inject]
		public var contextView:ContextView;
		
		public function execute():void {
			var view:Sprite = activeViews.get(viewName);
			(view as viewName.viewClass).destroy();
			if (contextView.view.contains(view)) {
				contextView.view.removeChild(view);
			}
		}
	}
}
