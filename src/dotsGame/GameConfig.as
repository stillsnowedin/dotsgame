package dotsGame {
	import dotsGame.models.ActiveViews;
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.signals.HideGrid;
	import dotsGame.signals.HideGridCommand;
	import dotsGame.signals.HideSpecs;
	import dotsGame.signals.HideSpecsCommand;
	import dotsGame.signals.HideStatus;
	import dotsGame.signals.HideStatusCommand;
	import dotsGame.signals.HideVictory;
	import dotsGame.signals.HideVictoryCommand;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowGridCommand;
	import dotsGame.signals.ShowSpecs;
	import dotsGame.signals.ShowSpecsCommand;
	import dotsGame.signals.ShowStatus;
	import dotsGame.signals.ShowStatusCommand;
	import dotsGame.signals.ShowVictory;
	import dotsGame.signals.ShowVictoryCommand;
	import dotsGame.signals.SwapColor;
	import dotsGame.signals.SwapColorCommand;
	import dotsGame.signals.UpdateScore;
	import dotsGame.signals.UpdateScoreCommand;
	import dotsGame.views.Grid;
	import dotsGame.views.GridMediator;
	import dotsGame.views.Specs;
	import dotsGame.views.SpecsMediator;
	import dotsGame.views.Status;
	import dotsGame.views.StatusMediator;
	import dotsGame.views.Victory;
	import dotsGame.views.VictoryMediator;

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
			mediatorMap.map(Specs).toMediator(SpecsMediator);
			mediatorMap.map(Status).toMediator(StatusMediator);
			mediatorMap.map(Grid).toMediator(GridMediator);
			mediatorMap.map(Victory).toMediator(VictoryMediator);
		}
		
		private function mapSignalsToCommands():void {
			signalCommandMap.map(ShowSpecs).toCommand(ShowSpecsCommand);
			signalCommandMap.map(HideSpecs).toCommand(HideSpecsCommand);
			signalCommandMap.map(ShowStatus).toCommand(ShowStatusCommand);
			signalCommandMap.map(HideStatus).toCommand(HideStatusCommand);
			signalCommandMap.map(ShowGrid).toCommand(ShowGridCommand);
			signalCommandMap.map(HideGrid).toCommand(HideGridCommand);
			signalCommandMap.map(SwapColor).toCommand(SwapColorCommand);
			signalCommandMap.map(UpdateScore).toCommand(UpdateScoreCommand);
			signalCommandMap.map(ShowVictory).toCommand(ShowVictoryCommand);
			signalCommandMap.map(HideVictory).toCommand(HideVictoryCommand);
		}
		
		private function showMenu():void {
			var showSpecs:ShowSpecs = injector.getInstance(ShowSpecs);
			showSpecs.dispatch();
		}
	}
}
