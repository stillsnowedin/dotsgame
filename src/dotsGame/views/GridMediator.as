package dotsGame.views {
	import dotsGame.models.Layout;

	import robotlegs.bender.bundles.mvcs.Mediator;

	public class GridMediator extends Mediator {
		
		[Inject]
		public var grid:Grid;
		
		[Inject]
		public var layout:Layout;
		
		override public function initialize():void {
			grid.init(layout.gridData);
		}
	}
}
