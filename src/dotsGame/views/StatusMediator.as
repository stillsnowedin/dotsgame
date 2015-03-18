package dotsGame.views {
	import dotsGame.models.Layout;

	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * @author Kathryn
	 */
	public class StatusMediator extends Mediator {
		
		[Inject]
		public var status:Status;
		
		[Inject]
		public var layout:Layout;
		
		override public function initialize():void {
			status.init(layout.firstPlayerData, layout.secondPlayerData, layout.firstScore, layout.secondScore);
		}
	}
}
