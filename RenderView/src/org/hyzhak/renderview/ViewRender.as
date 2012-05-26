package org.hyzhak.renderview
{
	import flash.display.DisplayObject;
	
	/**
	 * 
	 * @project	RenderView
	 * 
	 * @data	May 26, 2012 / 4:23:55 PM
	 * 
	 * @author	Eugene Krevents aka Hyzhak 
	 * 
	 */
	
	public interface ViewRender
	{
		function invalidate() : ViewRender;
		
		function forTarget(target : DisplayObject) : ViewRender;
		
		function onRefresh(callback : Function) : ViewRender;
	}
}