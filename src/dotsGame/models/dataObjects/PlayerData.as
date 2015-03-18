package dotsGame.models.dataObjects {

	public class PlayerData {
		private var _name:String;
		private var _color:uint;
		
		public function PlayerData(name:String, color:uint) {
			_name = name;
			_color = color;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function get color():uint {
			return _color;
		}
	}
}
