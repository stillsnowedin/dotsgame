package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;
	import dotsGame.signals.SwapColor;
	import dotsGame.signals.UpdateScore;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class GridMediator extends Mediator {
		
		[Inject]
		public var grid:Grid;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var score:Score;
		
		[Inject]
		public var swapColor:SwapColor;
		
		[Inject]
		public var updateScore:UpdateScore;
		
		override public function initialize():void {
			trace("[GridMediator] initalizing");
			grid.init(layout.gridData, layout.currentColor);
			grid.edgeClicked.add(onEdgeClicked);
			grid.boxMade.add(onBoxMade);
		}
		
		private function onEdgeClicked():void {
			score.swapTurn();
			swapColor.dispatch();
			grid.edgeColor = layout.currentColor;
		}
		
		private function onBoxMade():void {
			score.increaseScore();
			updateScore.dispatch();
		}
	}
}
