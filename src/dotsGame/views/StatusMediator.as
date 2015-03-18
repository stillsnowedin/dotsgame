package dotsGame.views {
	import dotsGame.models.GridLayout;

	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * @author Kathryn
	 */
	public class StatusMediator extends Mediator {
		
		[Inject]
		public var status:Status;
		
		[Inject]
		public var gridLayout:GridLayout;
		
		override public function initialize():void {
			status.init(gridLayout.firstPlayerData, gridLayout.secondPlayerData, gridLayout.firstScore, gridLayout.secondScore);
		}
	}
}
