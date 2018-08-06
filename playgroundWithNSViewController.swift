import Cocoa
import PlaygroundSupport

class MyVC: NSViewController {
    
    var slider : NSSlider!
    var textfield : NSTextField!
    var bgview : NSView!
    
    var value: Double = 0.0 {
        willSet{
            print("will set \(value)")
        }
        didSet{
            print("did set \(value)")
            self.bgview.alphaValue = CGFloat(value)
        }
    }

    override func loadView() {

        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))

        self.bgview = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
        // imoortant - self.bgview.wantsLayer
        self.bgview.wantsLayer = true
        self.bgview?.layer?.backgroundColor = CGColor(red: CGFloat(0.7), green: CGFloat(0.6), blue: CGFloat(0.4), alpha: CGFloat(1.0))
        self.view.addSubview(self.bgview)

        self.textfield = NSTextField(string: "hola")
        self.view.addSubview(self.textfield!)
        
        self.slider = NSSlider(target: self, action: #selector(sliderValueChanged))
        self.slider?.frame = NSRect(x: 0, y: 0, width: 400, height: 400)
        self.slider?.doubleValue = 0.5
        self.view.addSubview(slider!)  

    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sliderValueChanged(_ sender: NSSlider) {
        value = sender.doubleValue
        self.textfield.stringValue = String(format: "%.01f", value) 
    }

}

let myvc = MyVC()
PlaygroundPage.current.liveView = myvc
