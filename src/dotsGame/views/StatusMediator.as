package dotsGame.views {
	import dotsGame.models.Layout;
	import dotsGame.models.Score;

	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * @author Kathryn
	 */
	public class StatusMediator extends Mediator {
		
		[Inject]
		public var status:Status;
		
		[Inject]
		public var layout:Layout;
		
		[Inject]
		public var score:Score;
		
		override public function initialize():void {
			status.init(layout.firstPlayerData, layout.secondPlayerData, score.firstScore, score.secondScore);
		}
	}
}
