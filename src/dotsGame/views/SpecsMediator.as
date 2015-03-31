package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.signals.HideSpecs;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowStatus;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class SpecsMediator extends Mediator {
		
		[Inject]
		public var specs:Specs;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var hideSpecs:HideSpecs;
		
		[Inject]
		public var showStatus:ShowStatus;
		
		[Inject]
		public var showGrid:ShowGrid;
		
		override public function initialize():void {
			specs.init();
			specs.playGame.add(onPlayGame);
		}
		
		private function onPlayGame():void {
			layout.initGrid(specs.gridRows, specs.gridColumns);
			layout.initPlayers(specs.firstName, specs.firstColor, specs.secondName, specs.secondColor);
			hideSpecs.dispatch();
			showStatus.dispatch();
			showGrid.dispatch();
		}
	}
}
