package dotsGame {
	import dotsGame.bundles.MenuAssetBundle;
	import dotsGame.models.ActiveViews;
	import dotsGame.signals.HideMenu;
	import dotsGame.signals.HideMenuCommand;
	import dotsGame.signals.ShowMenu;
	import dotsGame.signals.ShowMenuCommand;
	import dotsGame.signals.ShowStatus;
	import dotsGame.signals.ShowStatusCommand;
	import dotsGame.views.Menu;
	import dotsGame.views.MenuMediator;
	import dotsGame.views.Status;
	import dotsGame.views.StatusMediator;

	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.signalCommandMap.api.ISignalCommandMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;

	import org.assetloader.AssetLoader;
			
	public class GameConfig implements IConfig {
		
		[Inject]
    	public var injector:IInjector;
    	
		[Inject]
    	public var mediatorMap:IMediatorMap;

    	[Inject]
		public var signalCommandMap:ISignalCommandMap;
		
    	[Inject]
    	public var contextView:ContextView;

    	public function configure():void {
			mapModelsAsSingletons();
			mapBundlesAsSingletons();
			mapServicesAsSingletons();
			mapViewsToMediators();
			mapSignalsToCommands();
			showMenu();
    	}
		
		private function mapModelsAsSingletons():void {
			injector.map(ActiveViews).asSingleton();
		}
		
		private function mapBundlesAsSingletons():void {
			injector.map(MenuAssetBundle).asSingleton();
		}
		
		private function mapServicesAsSingletons():void {
			injector.map(AssetLoader).asSingleton();
		}
		
		private function mapViewsToMediators():void {
			mediatorMap.map(Menu).toMediator(MenuMediator);
			mediatorMap.map(Status).toMediator(StatusMediator);
		}
		
		private function mapSignalsToCommands():void {
			signalCommandMap.map(ShowMenu).toCommand(ShowMenuCommand);
			signalCommandMap.map(HideMenu).toCommand(HideMenuCommand);
			signalCommandMap.map(ShowStatus).toCommand(ShowStatusCommand);
		}
		
		private function showMenu():void {
			var showMenuSignal:ShowMenu = injector.getInstance(ShowMenu);
			showMenuSignal.dispatch();
		}
	}
}
