package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.signals.SwapColor;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class GridMediator extends Mediator {
		
		[Inject]
		public var grid:Grid;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var swapColor:SwapColor;
		
		override public function initialize():void {
			grid.init(layout.gridData, layout.currentColor);
			grid.edgeClicked.add(onEdgeClicked);
		}
		
		private function onEdgeClicked():void {
			//tell grid the color of the line
			//tell layout to swap colors
			swapColor.dispatch();
			grid.edgeColor = layout.currentColor;
			//check if box formed
			//update score
			//check if win state
		}
	}
}
