package dotsGame.views {
	import dotsGame.signals.HideMenu;
	import robotlegs.bender.bundles.mvcs.Mediator;

	import dotsGame.bundles.MenuAssetBundle;
	import dotsGame.signals.ShowStatus;
	
	public class MenuMediator extends Mediator {
		
		[Inject]
		public var menu:Menu;
		
		[Inject]
		public var menuAssets:MenuAssetBundle;
		
		[Inject]
		public var hideMenu:HideMenu;
		
		[Inject]
		public var showStatus:ShowStatus;
		
		override public function initialize():void {
			menu.init(menuAssets);
			menu.startGame.add(onStartGame);
		}
		
		private function onStartGame():void {
			hideMenu.dispatch();
			showStatus.dispatch();
		}
	}
}
