package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.dataObjects.ViewName;
	import dotsGame.signals.HideView;
	import dotsGame.signals.ShowView;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class SpecsMediator extends Mediator {
		
		[Inject]
		public var specs:Specs;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var hideView:HideView;
		
		[Inject]
		public var showView:ShowView;
		
		override public function initialize():void {
			trace("[SpecsMediator] initalizing");
			specs.init(layout.firstPlayerData, layout.secondPlayerData, layout.gridData);
			specs.playGame.add(onPlayGame);
		}
		
		private function onPlayGame():void {
			layout.setGrid(specs.gridRows, specs.gridColumns);
			layout.setPlayers(specs.firstName, specs.firstColor, specs.secondName, specs.secondColor);
			hideView.dispatch(ViewName.SPECS);
			showView.dispatch(ViewName.STATUS);
			showView.dispatch(ViewName.GRID);
		}
	}
}
