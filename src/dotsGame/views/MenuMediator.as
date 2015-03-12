package dotsGame.views {
	import dotsGame.signals.HideMenu;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowStatus;

	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class MenuMediator extends Mediator {
		
		[Inject]
		public var menu:Menu;
		
		[Inject]
		public var hideMenu:HideMenu;
		
		[Inject]
		public var showStatus:ShowStatus;
		
		[Inject]
		public var showGrid:ShowGrid;
		
		override public function initialize():void {
			menu.init();
			menu.startGame.add(onStartGame);
		}
		
		private function onStartGame():void {
			hideMenu.dispatch();
			showStatus.dispatch();
			showGrid.dispatch();
		}
	}
}
