package dotsGame.signals {
	import dotsGame.models.dataObjects.ViewName;

	import org.osflash.signals.Signal;

	public class ShowView extends Signal {
		public function ShowView():void {
			super(ViewName);
		}
	}
}
