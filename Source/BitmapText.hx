package;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.events.Event;

class BitmapText extends Sprite {
    private var textBox : TextField;
    private var bm : Bitmap;
    public function new(text : TextField) {
        super();
        setupText(text);
        trace(text.width,text.height);
        openfl.Lib.current.stage.addEventListener(Event.RESIZE, function(e : Event) {
            setupText(text);
        });
    }

    private function setupText(text :TextField) {
        if (bm != null) {
            removeChild(bm);
        }
        var bmd:BitmapData = new BitmapData(cast(text.width, Int),cast(text.height, Int),true);
        bmd.draw(text, null);
        bm = new Bitmap(bmd);
        textBox = text;
        addChild(bm);
    }
}
