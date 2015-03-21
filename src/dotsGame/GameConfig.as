package dotsGame {
	import dotsGame.models.ActiveViews;
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.signals.HideSpecs;
	import dotsGame.signals.HideSpecsCommand;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowGridCommand;
	import dotsGame.signals.ShowSpecs;
	import dotsGame.signals.ShowSpecsCommand;
	import dotsGame.signals.ShowStatus;
	import dotsGame.signals.ShowStatusCommand;
	import dotsGame.signals.SwapColor;
	import dotsGame.signals.SwapColorCommand;
	import dotsGame.views.Grid;
	import dotsGame.views.GridMediator;
	import dotsGame.views.Specs;
	import dotsGame.views.SpecsMediator;
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
			injector.map(Layout).asSingleton();
			injector.map(Score).asSingleton();
		}
		
		private function mapServicesAsSingletons():void {
			injector.map(AssetLoader).asSingleton();
		}
		
		private function mapViewsToMediators():void {
			mediatorMap.map(Status).toMediator(StatusMediator);
			mediatorMap.map(Specs).toMediator(SpecsMediator);
			mediatorMap.map(Grid).toMediator(GridMediator);
		}
		
		private function mapSignalsToCommands():void {
			signalCommandMap.map(ShowStatus).toCommand(ShowStatusCommand);
			signalCommandMap.map(ShowSpecs).toCommand(ShowSpecsCommand);
			signalCommandMap.map(HideSpecs).toCommand(HideSpecsCommand);
			signalCommandMap.map(ShowGrid).toCommand(ShowGridCommand);
			signalCommandMap.map(SwapColor).toCommand(SwapColorCommand);
		}
		
		private function showMenu():void {
			var showSpecs:ShowSpecs = injector.getInstance(ShowSpecs);
			showSpecs.dispatch();
		}
	}
}
