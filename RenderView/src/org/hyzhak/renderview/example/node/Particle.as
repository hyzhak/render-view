package org.hyzhak.renderview.example.node
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import org.hyzhak.renderview.ViewRender;
	
	
	/**
	 * 
	 * @project	RenderView
	 * 
	 * @data	May 26, 2012 / 3:28:09 PM
	 * 
	 * @author	Eugene Krevents aka Hyzhak 
	 * 
	 */
	
	public class Particle extends Sprite
	{
		//----------------------------------
		//  params 
		//----------------------------------
		
		private var _width : Number = 100;
		
		private var _height : Number = 100;
		
		private var _orgColor : Number = 0x000000;
		
		private var _highLightColor : Number = 0xFFFFFF;
		
		private var _highlight : Boolean = false;
		
		private var _render : ViewRender;
		
		//----------------------------------
		//  constructor 
		//----------------------------------
		
		public function Particle()
		{
			startListenMouse();
		}
		
		public function withRender(render : ViewRender) : Particle
		{
			_render = render;
			
			if(_render != null)
			{
				_render
					.forTarget(this)
					.onRefresh(refresh);
			}
			
			return this;
		}
		
		public function atX(value : Number) : Particle
		{
			x = value;
			return this;
		}
		
		public function atY(value : Number) : Particle
		{
			y = value;
			return this;
		}
		
		public function color(value : Number) : Particle
		{
			if(_orgColor != value)
			{
				_orgColor = value;
				_render.invalidate();
			}
			
			return this;
		}
		
		public function get highlight():Boolean
		{
			return _highlight;
		}
		
		public function set highlight(value:Boolean):void
		{
			if(_highlight == value)
			{
				return;
			}
			
			_highlight = value;
			
			_render.invalidate()
		}
		
		//--------------------------------------------------------------------------
		//
		//  EventHandlers
		//
		//--------------------------------------------------------------------------
		
		protected function onMouseOver(event:MouseEvent):void
		{
			highlight = true;
		}
		
		protected function onMouseOut(event:MouseEvent):void
		{
			highlight = false;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private.Methods
		//
		//--------------------------------------------------------------------------
		
		private function startListenMouse():void
		{
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		}
		
		private function refresh() : void
		{
			var g : Graphics = graphics;
			g.clear();
			g.beginFill(highlight?_highLightColor:_orgColor, 0.5);
			g.drawRect(0, 0, _width, _height);
			g.endFill();
		}

	}
}