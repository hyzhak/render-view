package org.hyzhak.renderview.core
{
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.Event;
	
	import org.hyzhak.renderview.ViewRender;
	
	
	/**
	 * 
	 * @project	RenderView
	 * 
	 * @data	May 26, 2012 / 4:26:13 PM
	 * 
	 * @author	Eugene Krevents aka Hyzhak 
	 * 
	 */
	
	public class ViewRenderImpl implements ViewRender
	{
		//----------------------------------
		//  params 
		//----------------------------------
		
		private var _invalide : Boolean = false;
		
		private var _target:DisplayObject;
		
		private var _callback:Function;
		
		//--------------------------------------------------------------------------
		//
		//  RenderView
		//
		//--------------------------------------------------------------------------
		
		public function invalidate() : ViewRender
		{
			invalide = true;			
			return this;
		}		
		
		public function forTarget(target:DisplayObject):ViewRender
		{
			_target = target;
			return this;
		}
		
		public function onRefresh(callback:Function):ViewRender
		{
			if(callback.length != 0)
			{
				throw new Error("Callback must be without any parameters.");
			}
			_callback = callback;
			return this;
		}
		
		//--------------------------------------------------------------------------
		//
		//  EventHandlers
		//
		//--------------------------------------------------------------------------
		
		protected function onRender(event:Event):void
		{
			invalide = false;
		}
		
		protected function onAddedToStage(event:Event):void
		{
			_target.stage.invalidate();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private.Methods
		//
		//--------------------------------------------------------------------------
		
		private function get invalide():Boolean
		{
			return _invalide;
		}
		
		private function set invalide(value:Boolean):void
		{
			if(_invalide == value)
			{
				return;
			}
			
			_invalide = value;
			
			if(_target == null)
			{
				return;
			}
			
			if(value)
			{
				_target.addEventListener(Event.RENDER, onRender);
				
				if(_target.stage == null)
				{
					_target.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				}
				else
				{
					_target.stage.invalidate();
				}
			}
			else
			{
				_target.removeEventListener(Event.RENDER, onRender);
				
				if(_target.stage == null)
				{
					_target.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				}
				
				executeCallback();
			}
		}
		
		private function executeCallback():void
		{
			if(_callback != null)
			{
				_callback.call(_target);
			}
		}
	}
}