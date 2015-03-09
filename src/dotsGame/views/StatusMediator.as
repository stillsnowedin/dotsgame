package dotsGame.views {
	import robotlegs.bender.bundles.mvcs.Mediator;
	/**
	 * @author Kathryn
	 */
	public class StatusMediator extends Mediator {
		
		[Inject]
		public var status:Status;
		
		override public function initialize():void {
			status.init();
		}
	}
}
