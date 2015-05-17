package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		var bRight:Boolean 		= false;
		var bLeft:Boolean 		= false;
		var bScroll:Boolean		= false;
		
		public function Main() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			stage.addEventListener('keyDown', onKeyDown);
			stage.addEventListener('keyUp', onKeyUp);
		}
		
		
		private function onEnterFrame(e:Event):void
		{
			if(bScroll==true){
				moveScroll();
			}else{
				moveHero();
			}
		}
		
		private function moveScroll(){
			if(bRight==true){
				if(instScene.x>=-1595){
					instScene.x = instScene.x - 5;
				}else{
					bScroll = false;
				}
			}
			
			if(bLeft==true){
				if(instScene.x<=-5){
					instScene.x = instScene.x + 5;
				}else{
					bScroll = false;
				}
			}			
		}
		
		private function moveHero(){

			if(bRight==true){
				if(instHero.x<(800-instHero.width)){
					instHero.x = instHero.x + 5;
				}
				if(instHero.x>(400-instHero.width)){
					if(instScene.x>=-1195){
						bScroll = true;
					}
				}				
			}
			
			if(bLeft==true){
				if(instHero.x>0){
					instHero.x = instHero.x - 5;
				}
				if(instHero.x<=(400-instHero.width)){
					bScroll = true;
				}
			}			
			
		}
		
		private function onKeyDown(e){
			
			if(e.keyCode==39){
				bRight = true;
			}
			if(e.keyCode==37){
				bLeft = true;
			}	
		}

		private function onKeyUp(e){
			
			if(e.keyCode==39){
				bRight = false;
			}
			if(e.keyCode==37){
				bLeft = false;
			}	
		}
		
		
		
	}
	
}
