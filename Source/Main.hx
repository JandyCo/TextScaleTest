package;

import openfl.display.Sprite;
import openfl.events.Event;

import openfl.text.*;

class Main extends Sprite {
    private var container : Sprite;
    private var text : TextField;
	
	public function new () {
		super ();
        openfl.Lib.current.stage.addEventListener(Event.RESIZE,onResize);
        onResize(null);

        createText();        

        container = new Sprite();
        openfl.Lib.current.stage.addEventListener(Event.RESIZE, function(event : Event) {
            trace("onResize - TextHeight:" + text.textHeight + " TextWidth: " + text.textWidth);
            text.x = container.width/2 - text.textWidth/2; 
            text.y = container.height/2 - text.textHeight/2; 
        });
        container.graphics.beginFill(0xCCCCCC,1);
        container.graphics.drawRect(0,0,100,50);
        container.graphics.endFill();
        container.addChild(text);
        container.width = text.textWidth + 4;
        container.height = text.textHeight + 4;

        createCenterMarker();

        text.x = container.width/2 - text.textWidth/2; 
        text.y = container.height/2 - text.textHeight/2; 

        addChild(container);

        trace("Initial - TextHeight:" + text.textHeight + " TextWidth: " + text.textWidth);
	}

    private function createText() {
        text = new TextField();
        text.autoSize = TextFieldAutoSize.LEFT;
        text.defaultTextFormat = new TextFormat(null,30);
        text.defaultTextFormat.align = TextFormatAlign.CENTER;
        text.text = "Test Text";
    }

    private function createCenterMarker() {
        var centerMarker = new Sprite();
        centerMarker.graphics.beginFill(0xCC0000,1);
        centerMarker.graphics.drawRect(0,0,5,5);
        centerMarker.graphics.endFill();
        container.addChildAt(centerMarker,0);
        centerMarker.x = container.width/2 - centerMarker.width/2;
        centerMarker.y = container.height/2 - centerMarker.height/2;
    }

    private function onResize(event : Event) {
        this.scaleX = openfl.Lib.current.stage.stageWidth/200;
        this.scaleY = openfl.Lib.current.stage.stageHeight/200;
    }
}
