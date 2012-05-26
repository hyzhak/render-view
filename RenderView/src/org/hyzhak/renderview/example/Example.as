package org.hyzhak.renderview.example
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import org.hyzhak.renderview.core.ViewRenderImpl;
	import org.hyzhak.renderview.example.node.Particle;
	
	
	/**
	 * 
	 * @project	RenderView
	 * 
	 * @data	May 26, 2012 / 3:10:32 PM
	 * 
	 * @author	Eugene Krevents aka Hyzhak 
	 * 
	 */
	
	public class Example extends Sprite
	{
		//----------------------------------
		//  params 
		//----------------------------------
		
		//----------------------------------
		//  constructor 
		//----------------------------------
		
		public function Example()
		{
			initInstance();
		}
		
		private function initInstance():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			
			var i : int = 100;
			while(--i>=0)
			{
				addParticle(buildParticle());
			}
		}
		
		private function addParticle(particle:Particle):void
		{
			addChild(particle);
		}
		
		private function buildParticle():Particle
		{
			return new Particle()
				.withRender(new ViewRenderImpl())
				.atX(stage.stageWidth * Math.random())
				.atY(stage.stageHeight * Math.random())
				.color(0xFFFFFF * Math.random());
		}
	}
}