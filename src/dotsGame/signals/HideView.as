package dotsGame.signals {
	import dotsGame.models.dataObjects.ViewName;

	import org.osflash.signals.Signal;

	public class HideView extends Signal {
		public function HideView():void {
			super(ViewName);
		}
	}
}
