package dotsGame {
	import dotsGame.models.ActiveViews;
	import dotsGame.signals.HideMenu;
	import dotsGame.signals.HideMenuCommand;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowGridCommand;
	import dotsGame.signals.ShowMenu;
	import dotsGame.signals.ShowMenuCommand;
	import dotsGame.signals.ShowStatus;
	import dotsGame.signals.ShowStatusCommand;
	import dotsGame.views.Grid;
	import dotsGame.views.GridMediator;
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
			mapServicesAsSingletons();
			mapViewsToMediators();
			mapSignalsToCommands();
			showMenu();
    	}
		
		private function mapModelsAsSingletons():void {
			injector.map(ActiveViews).asSingleton();
		}
		
		private function mapServicesAsSingletons():void {
			injector.map(AssetLoader).asSingleton();
		}
		
		private function mapViewsToMediators():void {
			mediatorMap.map(Menu).toMediator(MenuMediator);
			mediatorMap.map(Status).toMediator(StatusMediator);
			mediatorMap.map(Grid).toMediator(GridMediator);
		}
		
		private function mapSignalsToCommands():void {
			signalCommandMap.map(ShowMenu).toCommand(ShowMenuCommand);
			signalCommandMap.map(HideMenu).toCommand(HideMenuCommand);
			signalCommandMap.map(ShowStatus).toCommand(ShowStatusCommand);
			signalCommandMap.map(ShowGrid).toCommand(ShowGridCommand);
		}
		
		private function showMenu():void {
			var showMenuSignal:ShowMenu = injector.getInstance(ShowMenu);
			showMenuSignal.dispatch();
		}
	}
}
