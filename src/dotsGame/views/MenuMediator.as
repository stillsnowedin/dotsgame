package dotsGame.views {
	import dotsGame.signals.HideMenu;
	import dotsGame.signals.ShowSpecs;

	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class MenuMediator extends Mediator {
		
		[Inject]
		public var menu:Menu;
		
		[Inject]
		public var hideMenu:HideMenu;
		
		[Inject]
		public var showSpecs:ShowSpecs;
		
		override public function initialize():void {
			menu.init();
			menu.newGame.add(onNewGame);
		}
		
		private function onNewGame():void {
			hideMenu.dispatch();
			showSpecs.dispatch();
		}
	}
}
