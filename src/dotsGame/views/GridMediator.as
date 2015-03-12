package dotsGame.views {
	import dotsGame.models.GridLayout;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class GridMediator extends Mediator {
		
		[Inject]
		public var grid:Grid;
		
		[Inject]
		public var gridLayout:GridLayout;
		
		override public function initialize():void {
			grid.init(gridLayout.gridData);
		}
	}
}
