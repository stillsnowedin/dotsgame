package dotsGame.views {
	import dotsGame.models.GridLayout;
	import dotsGame.signals.HideSpecs;
	import dotsGame.signals.ShowGrid;
	import dotsGame.signals.ShowStatus;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class SpecsMediator extends Mediator {
		
		[Inject]
		public var specs:Specs;
		
		[Inject]
		public var gridLayout:GridLayout;
		
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
			gridLayout.initGrid(specs.gridRows, specs.gridColumns);
			gridLayout.initFirstPlayer(specs.firstName, specs.firstColor);
			gridLayout.initSecondPlayer(specs.secondName, specs.secondColor);
			hideSpecs.dispatch();
			showStatus.dispatch();
			showGrid.dispatch();
		}
	}
}
