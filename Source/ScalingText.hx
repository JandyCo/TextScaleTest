package;

class ScalingText extends TextField {
    public var maxWidth : Null<Float>;
    public var maxHeight  : Null<Float>;
    public var increment  : Int = 1;

    public function new(maxWidth, maxHeight) {
        super();
        wordWrap = true;
        this.maxWidth = maxWidth;
        this.maxHeight = maxHeight;
        autoSize = TextFieldAutoSize.LEFT;
        openfl.Lib.current.stage.addEventListener(Event.RESIZE, onResize);
        addEventListener(Event.ADDED_TO_STAGE,addedToStage);
    }

    private function onResize(event : Event) {
        trace("onResize: " + this.textWidth);
        increaseSize();
    }

    private function increaseSize() {
        while ((maxWidth != null && textWidth < maxWidth) && (maxHeight != null && textHeight < maxHeight)) {
            trace("increaseSize: " + textWidth + " " + textHeight + " " + maxWidth + " " + maxHeight + " " + defaultTextFormat.size);
            var format = defaultTextFormat;
            format.size += increment;
            setTextFormat(format);
            defaultTextFormat = format;
        }
        decreaseSize();
    }

    private function decreaseSize() {
        while ((maxWidth != null && textWidth > maxWidth) || (maxHeight != null && textHeight > maxHeight)) {
            trace("decrease: " + textWidth + " " + textHeight + " " + maxWidth + " " + maxHeight + " " +  defaultTextFormat.size);
            var format = defaultTextFormat;
            format.size -= increment;
            setTextFormat(format);
            defaultTextFormat = format;
        }
    }

    private function addedToStage(event : Event) {
        trace("addedToStage: " + this.textWidth);
    }
}
