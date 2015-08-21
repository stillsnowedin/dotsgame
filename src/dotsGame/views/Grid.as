package dotsGame.views {
	import dotsGame.Utils;
	import dotsGame.models.dataObjects.GridData;
	import dotsGame.views.components.BasicShapes;
	import dotsGame.views.components.Edge;

	import org.osflash.signals.Signal;

	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
	import flash.geom.Point;
	
	public class Grid extends Sprite {
		private static const SQUARE_COLOR:uint = 0x292929;
		private static const DOT_COLOR:uint = 0xEEEEEE;
		private static const EDGE_COLOR:uint = 0x292929;
		private var _edgeClicked:Signal;
		private var _boxMade:Signal;
		private var _edgeColor:uint;
		private var layout:GridData;
		private var squares:Vector.<Shape>;
		private var dots:Vector.<Shape>;
		private var edges:Vector.<Edge>;
		private var squareLayer:Sprite;
		private var dotLayer:Sprite;
		private var edgeLayer:Sprite;
		
		public function Grid():void {
			_edgeClicked = new Signal();
			_boxMade = new Signal();
			squares = new Vector.<Shape>();
			dots = new Vector.<Shape>();
			edges = new Vector.<Edge>();
			squareLayer = new Sprite();
			dotLayer = new Sprite();
			edgeLayer = new Sprite();
		}
		
		public function init(layout:GridData, edgeColor:uint):void {
			_edgeColor = edgeColor;
			this.layout = layout;
			initLayers();
			initSquares();
			initDots();
			initEdges();
			centerGridPosition();
		}
		
		private function initLayers():void {
			this.addChild(squareLayer);
			this.addChild(dotLayer);
			this.addChild(edgeLayer);
		}
		
		private function initSquares():void {
			var row:uint = 0;
			for (var i:uint=0; i<numSquares(); i++) {
				squares[i] = createSquare(i, row);
				squareLayer.addChild(squares[i]);
				if (increaseSquareRow(i)) row++;
			}
		}
		
		private function numSquares():uint {
			var total:uint = layout.rows * layout.columns;
			return total;
		}
		
		private function createSquare(index:uint, row:uint):Shape {
			var square:Shape = BasicShapes.rectangle(layout.boxSize, layout.boxSize, SQUARE_COLOR, 0);
			square.x = (index % layout.columns) * layout.boxSize;
			square.y = row * layout.boxSize;
			return square;
		}
		
		private function increaseSquareRow(index:uint):Boolean {
			return index % layout.columns == (layout.columns - 1);
		}
		
		private function initDots():void {
			var row:int = 0;
			for (var i:uint=0; i<numDots(); i++) {
				dots[i] = createDot(i, row);
				dotLayer.addChild(dots[i]);
				if (increaseDotRow(i)) row++;
			}
		}
		
		private function numDots():uint {
			var total:uint = (layout.rows + 1) * (layout.columns + 1);
			return total;
		}
		
		private function createDot(index:uint, row:uint):Shape {
			var dot:Shape = BasicShapes.circle(layout.dotRadius, DOT_COLOR);
			dot.x = (index % (layout.columns+1)) * layout.boxSize;
			dot.y = row * layout.boxSize;
			return dot;
		}
		
		private function increaseDotRow(index:uint):Boolean {
			return ((index+1) % (layout.columns + 1)) == 0;
		}
		
		private function initEdges():void {
			var row:int = 0;
			var edgesInRow:uint = 0;
			for (var i:uint=0; i<numEdges(); i++) {
				var edgePos:Point = isVertEdge(edgesInRow) ? vertEdgePosition(i, row) : horzEdgePosition(i, row);
				var edgeWidth:uint = isVertEdge(edgesInRow) ? layout.edgeWidth : layout.edgeLength;
				var edgeHeight:uint = isVertEdge(edgesInRow) ? layout.edgeLength : layout.edgeWidth;
				edges[i] = createEdge(i, edgePos, edgeWidth, edgeHeight);
				edgeLayer.addChild(edges[i]);
				edgesInRow++;
				if (increaseEdgeRow(i)) { row++; edgesInRow = 0; }
			}
		}
		
		private function isVertEdge(edgeNum:uint):Boolean {
			return edgeNum >= layout.columns;
		}
		
		private function numEdges():uint {
			var total:uint = layout.rows * layout.columns * 2 + layout.rows + layout.columns;
			return total;
		}
		
		private function vertEdgePosition(index:uint, row:uint):Point {
			var position:Point = new Point();
			position.x = ((index+1+row) % (layout.columns+1)) * layout.boxSize - layout.edgeWidth/2;
			position.y = row * layout.boxSize + (layout.boxSize - layout.edgeLength)/2;
			return position;
		}
		
		private function horzEdgePosition(index:uint, row:uint):Point {
			var position:Point = new Point();
			position.x = ((index-row) % layout.columns) * layout.boxSize + (layout.boxSize - layout.edgeLength)/2;
			position.y = row * layout.boxSize - layout.edgeWidth/2;
			return position;
		}
		
		private function createEdge(index:uint, position:Point, width:uint, height:uint):Edge {
			var edge:Edge = new Edge(index, EDGE_COLOR, width, height);
			edge.x = position.x;
			edge.y = position.y;
			edge.highlighted.add(onEdgeHighlighted);
			edge.clicked.add(onEdgeClicked);
			return edge;
		}
		
		private function increaseEdgeRow(index:uint):Boolean {
			return index % (layout.columns * 2 + 1) == layout.columns * 2;
		}
		
		private function onEdgeHighlighted(index:uint):void {
			edges[index].changeColor(Utils.brighten(_edgeColor, 50));
		}
		
		private function onEdgeClicked(index:uint):void {
			edges[index].changeColor(_edgeColor);
			checkForBoxes(index);
		}
		
		private function checkForBoxes(index:uint):void {
			var edge:Edge = edges[index];
			edge.isVertical() ? checkLeftRight(index) : checkUpDown(index);
		}
		
		private function checkLeftRight(index : uint) : void {
			var leftBox:Vector.<uint> = null;
			if (!firstColumn(index)) {
				leftBox = box(index - 1,
							  index - (layout.columns + 1),
							  index + layout.columns);
			}
			var rightBox:Vector.<uint> = null;
			if (!lastColumn(index)) {
				rightBox = box(index + 1,
							   index + (layout.columns + 1),
							   index - layout.columns);
			}
			confirmBoxes(leftBox, rightBox);
		}
		
		private function firstColumn(index:uint):Boolean {
			return index % (layout.columns*2 + 1) == layout.columns;
		}
		
		private function lastColumn(index:uint):Boolean {
			return index % (layout.columns*2 + 1) == layout.columns*2;
		}
		
		private function box(edge1:uint, edge2:uint, edge3:uint):Vector.<uint> {
			var box:Vector.<uint> = new Vector.<uint>();
			box[0] = edge1;
			box[1] = edge2;
			box[2] = edge3;
			return box;
		}
		
		private function confirmBoxes(box1:Vector.<uint>, box2:Vector.<uint>):void {
			var noBoxes:Boolean = true;
			
			if (boxComplete(box1)) {
				fillSquare(box1); 
				_boxMade.dispatch(); 
				noBoxes = false; 
			}
			
			if (boxComplete(box2)) {
				fillSquare(box2); 
				_boxMade.dispatch(); 
				noBoxes = false; 
			}
			
			if (noBoxes)
				_edgeClicked.dispatch();
		}
		
		private function boxComplete(box:Vector.<uint>):Boolean {
			if (!boxExists(box)) return false;
			for (var i:int=0; i<box.length; i++)
				if (!edges[box[i]].eliminated) return false;
			return true;
		}
		
		private function boxExists(box:Vector.<uint>):Boolean {
			if (!box) return false;
			for (var i:uint = 0; i<box.length; i++)
				if (box[i] < 0 || box[i] >= edges.length) return false;
			return true;
		}
		
		private function fillSquare(box:Vector.<uint>):void {
			var squareRow:uint = Math.floor(box[0] / (layout.columns*2 + 1));
			var squareCol:uint = box[1] % (layout.columns*2 + 1);
			var squareIndex:uint = squareRow * layout.columns + squareCol;
			var square:Shape = squares[squareIndex];
			var trans:ColorTransform = square.transform.colorTransform;
			trans.alphaOffset = 255;
			trans.color = Utils.darken(_edgeColor, 75);
			square.transform.colorTransform = trans;
		}
		
		private function checkUpDown(index:uint):void {
			var upBox:Vector.<uint> = box(index - layout.columns,
										  index - (layout.columns*2 + 1),
										  index - (layout.columns + 1));
			
			var downBox:Vector.<uint> = box(index + layout.columns,
										 	index + (layout.columns*2 + 1),
										 	index + (layout.columns + 1));
			confirmBoxes(upBox, downBox);
		}
		
		private function centerGridPosition():void {
			this.x = (stage.stageWidth - layout.columns * layout.boxSize) / 2;
			this.y = layout.yOffset + ((stage.stageHeight - layout.yOffset) - layout.rows * layout.boxSize) / 2;
		}
		
		public function get edgeClicked():Signal {
			return _edgeClicked;
		}
		
		public function get boxMade():Signal {
			return _boxMade;
		}
		
		public function set edgeColor(color:uint):void {
			_edgeColor = color;
		}
		
		public function destroy():void {
			squareLayer.removeChildren();
			dotLayer.removeChildren();
			edgeLayer.removeChildren();
			this.removeChildren();
			_edgeClicked.removeAll();
			_boxMade.removeAll();
			
			for (var i:uint=0; i<squares.length; i++) {
				delete squares[i];
			}
			
			for (var j:uint=0; j<dots.length; j++) {
				delete dots[j];
			}
			
			for (var k:uint=0; k<edges.length; k++) {
				delete edges[k];
			}
		}
	}
}
