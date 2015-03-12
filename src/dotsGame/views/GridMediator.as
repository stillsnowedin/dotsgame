package dotsGame.views {
	import robotlegs.bender.bundles.mvcs.Mediator;

	public class GridMediator extends Mediator {
		
		[Inject]
		public var grid:Grid;
		
		override public function initialize():void {
			grid.init();
		}
	}
}
