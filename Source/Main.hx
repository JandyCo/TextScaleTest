package;

import openfl.display.Sprite;
import openfl.events.Event;

import openfl.text.*;

import BitmapText;

class Main extends Sprite {
    private var container : Sprite;
    private var centerMarker : Sprite;
    private var text : TextField;
	
	public function new () {
		super ();
        openfl.Lib.current.stage.addEventListener(Event.RESIZE,onResize);
        onResize(null);

        createText();        

        container = new Sprite();
        openfl.Lib.current.stage.addEventListener(Event.RESIZE, function(event : Event) {
            text.x = (container.width - text.textWidth)/2 ;

            trace("onResize - Height:" + text.height + " Width: " +text.width);
            trace("onResize - TextHeight:" + text.textHeight + " TextWidth: " + text.textWidth  );
            trace("x,y " + text.x + ", " 
                + text.y  + " container height,width ", container.height * this.scaleY + ", " + container.width*this.scaleX );
            //text.y = container.height/2 - text.textHeight/2; 
        });
        container.graphics.beginFill(0xCCCCCC,1);
        container.graphics.drawRect(0,0,100,50);
        container.graphics.endFill();
        createCenterMarker();

        container.addChild(text);
        container.width = 100;//text.textWidth + 4;
        container.height = 50;//text.textHeight + 4;

        text.x = container.width/2 - text.textWidth/2; 
        text.y = container.height/2 - text.textHeight/2; 
        
        addChild(container);

        trace("Initial - TextHeight:" + text.textHeight + " TextWidth: " + text.textWidth+ " x,y " + text.x + ", " + 
                text.y + " container height,width ", container.height * this.scaleY + ", " + container.width*this.scaleX );
	}

    private function createText() {
        text = new TextField();
        text.autoSize = TextFieldAutoSize.LEFT;
        text.defaultTextFormat = new TextFormat(null,30);
        text.defaultTextFormat.align = TextFormatAlign.CENTER;
        text.text = "Test Text";
        text.background = true;
        text.backgroundColor = 0x00FF00;
    }

    private function createCenterMarker() {
        centerMarker = new Sprite();
        centerMarker.graphics.beginFill(0xCC0000,1);
        centerMarker.graphics.drawRect(0,container.height/2,container.width,1);
        centerMarker.graphics.drawRect(container.width/2,0,1,container.height);
        centerMarker.graphics.endFill();
        container.addChildAt(centerMarker,0);
    }

    private function onResize(event : Event) {
        this.scaleX = openfl.Lib.current.stage.stageWidth/200;
        this.scaleY = openfl.Lib.current.stage.stageHeight/200;
        trace("Stage Scale:" +" " + this.scaleX + " " + this.scaleY);
    }

}
