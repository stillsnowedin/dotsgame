package dotsGame.views {
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Edge;

	import org.osflash.signals.Signal;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	public class Grid extends Sprite {
		private var _edgeClicked:Signal;
		private var _boxed:Signal;
		private var _edgeColor:uint;
		private var layout:GridData;
		private var boxes:Vector.<Shape>;
		private var dots:Vector.<Shape>;
		private var edges:Vector.<Edge>;
		private var boxLayer:Sprite;
		private var dotLayer:Sprite;
		private var edgeLayer:Sprite;
		
		public function Grid():void {
			_edgeClicked = new Signal();
			_boxed = new Signal();
			boxLayer = new Sprite();
			dotLayer = new Sprite();
			edgeLayer = new Sprite();
			this.addChild(boxLayer);
			this.addChild(dotLayer);
			this.addChild(edgeLayer);
		}
		
		public function init(layout:GridData, edgeColor:uint):void {
			_edgeColor = edgeColor;
			this.layout = layout;
			initBoxes();
			initDots();
			initEdges();
			centerGridPosition();
		}
		
		private function initBoxes():void {
			boxes = new Vector.<Shape>();
			var row:uint = 0;
			for (var i:uint=0; i<numBoxes(); i++) {
				boxes[i] = createBox(i, row);
				boxLayer.addChild(boxes[i]);
				if (increaseBoxRow(i)) row++;
			}
		}
		
		private function numBoxes():uint {
			var total:uint = layout.rows * layout.columns;
			return total;
		}
		
		private function createBox(index:uint, row:uint):Shape {
			var box:Shape = BasicShapes.rectangle(layout.boxSize, layout.boxSize, 0x333333, 0);
			box.x = (index % layout.columns) * layout.boxSize;
			box.y = row * layout.boxSize;
			return box;
		}
		
		private function increaseBoxRow(index:uint):Boolean {
			return index % layout.columns == 0;
		}
		
		private function initDots():void {
			dots = new Vector.<Shape>();
			var row:int = -1;
			for (var i:uint=0; i<numDots(); i++) {
				if (increaseDotRow(i)) row++;
				dots[i] = createDot(i, row);
				dotLayer.addChild(dots[i]);
			}
		}
		
		private function numDots():uint {
			var total:uint = (layout.rows + 1) * (layout.columns + 1);
			return total;
		}
		
		private function createDot(index:uint, row:uint):Shape {
			var dot:Shape = BasicShapes.circle(layout.dotRadius, 0x111111);
			dot.x = (index % (layout.columns+1)) * layout.boxSize;
			dot.y = row * layout.boxSize;
			return dot;
		}
		
		private function increaseDotRow(index:uint):Boolean {
			return (index % (layout.columns + 1)) == 0;
		}
		
		private function initEdges():void {
			edges = new Vector.<Edge>();
			var row:int = 0;
			var horizontalEdges:uint = 0;
			for (var i:uint=0; i<numEdges(); i++) {
				var position:Point = horizontalEdgePosition(i, row);
				var dimensions:Point = new Point(layout.edgeLength, layout.edgeWidth);
				if (horizontalEdges >= layout.columns) {
					position = verticalEdgePosition(i, row, position.y);
					dimensions = new Point(layout.edgeWidth, layout.edgeLength);
				}
				edges[i] = createEdge(i, dimensions, position);
				edgeLayer.addChild(edges[i]);
				horizontalEdges++;
				if (increaseEdgeRow(i)) {
					row++;
					horizontalEdges = 0;
				}
			}
		}
		
		private function numEdges():uint {
			var total:uint = layout.rows * (layout.columns + 1) + (layout.rows + 1) * layout.columns;
			return total;
		}
		
		private function increaseEdgeRow(index:uint):Boolean {
			return index % (layout.columns * 2 + 1) == layout.columns * 2;
		}
		
		private function horizontalEdgePosition(index:uint, row:uint):Point {
			var position:Point = new Point();
			position.x = ((index-row) % layout.columns) * layout.boxSize + (layout.boxSize - layout.edgeLength)/2;
			position.y = row * layout.boxSize - layout.edgeWidth/2;
			return position;
		}
		
		private function verticalEdgePosition(index:uint, row:uint, y:Number):Point {
			var position:Point = new Point();
			position.x = ((index+1+row) % (layout.columns+1)) * layout.boxSize - layout.edgeWidth/2;
			position.y = y + (layout.boxSize - layout.edgeLength + layout.dotRadius)/2;
			return position;
		}
		
		private function createEdge(index:uint, dimensions:Point, position:Point):Edge {
			var edge:Edge = new Edge(index, 0x555555, dimensions);
			edge.x = position.x;
			edge.y = position.y;
			edge.highlighted.add(onEdgeHighlighted);
			edge.clicked.add(onEdgeClicked);
			return edge;
		}
		
		private function onEdgeHighlighted(index:uint):void {
			edges[index].changeColor(0xFFFFFF);
		}
		
		private function onEdgeClicked(index:uint):void {
			edges[index].changeColor(_edgeColor);
			if (!checkForBoxes(index))
				_edgeClicked.dispatch();
		}
		
		private function checkForBoxes(index:uint):Boolean {
			var edge:Edge = edges[index];
			var box1:Vector.<uint> = new Vector.<uint>();
			box1[0] = index - (layout.columns + 1);
			box1[1] = index - (layout.columns*2 + 1);
			box1[2] = index - layout.columns;
			var box2:Vector.<uint> = new Vector.<uint>();
			box2[0] = index + layout.columns;
			box2[1] = index + (layout.columns*2 + 1);
			box2[2] = index + (layout.columns + 1);
			
			if (edge.width < edge.height) { //vertical edge
				box1[1] = index - 1;
				box1[2] = index + layout.columns;
				box2[1] = index + 1;
				box2[2] = index - layout.columns;
			}
			
			var madeBox:Boolean = false;
			if (boxExists(box1)) {
				if(boxComplete(box1)) madeBox = true;
			}
			
			if (boxExists(box2)) {
				if(boxComplete(box2)) madeBox = true;
			}
			
			return madeBox;
		}
		
		private function boxExists(box:Vector.<uint>):Boolean {
			for (var i:uint = 0; i<box.length; i++) {
				if (box[i] < 0 || box[i] >= edges.length) return false;
			}
			return true;
		}
		
		private function boxComplete(box:Vector.<uint>):Boolean {
			var allEdgesEliminated:Boolean = true;
			for (var i:int=0; i<box.length; i++) {
				allEdgesEliminated &&= edges[box[i]].eliminated;
			}
			
			if (allEdgesEliminated) {
				_boxed.dispatch();
				return true;
			}
			return false;
		}
		
		private function centerGridPosition():void {
			this.x = (stage.stageWidth - layout.columns * layout.boxSize) / 2;
			this.y = layout.yOffset + ((stage.stageHeight - layout.yOffset) - layout.rows * layout.boxSize) / 2;
		}
		
		public function get edgeClicked():Signal {
			return _edgeClicked;
		}
		
		public function get boxed():Signal {
			return _boxed;
		}
		
		public function set edgeColor(color:uint):void {
			_edgeColor = color;
		}
	}
}
