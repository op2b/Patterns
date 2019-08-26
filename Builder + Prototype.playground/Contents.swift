import UIKit

protocol ThemeProtocol {
    var backGroundColor: UIColor {get}
    var textColor: UIColor {get}
}

class Theme: ThemeProtocol {
    var backGroundColor: UIColor
    var textColor: UIColor
    
    init(backGroundColor: UIColor, textColor: UIColor) {
        self.backGroundColor = backGroundColor
        self.textColor = textColor
    }
}

protocol ThemeBuilderProtocol {
    func setBackGround(color: UIColor)
    func setText(color: UIColor)
    func createTheme()-> ThemeProtocol?
}

class ThemeBuilder: ThemeBuilderProtocol {
    
    private var backGroundColor: UIColor?
    private var textColor: UIColor?
    
    func setBackGround(color: UIColor) {
        self.backGroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    
    func createTheme() -> ThemeProtocol? {
        
        guard let backGroundCOlor = backGroundColor, let textColor = textColor else {return nil}
        return Theme(backGroundColor: backGroundCOlor, textColor: textColor)
    }
}

let builder = ThemeBuilder()
builder.setText(color: .white)
builder.setText(color: .black)
let theme = builder.createTheme()
print(theme!)


//Prototype

class CompicationObject {
    
    private var configuration: Data
    
    init(url: URL) {
        let manager = WebManager()
        self.configuration = manager.getData(with: url)
    }
    
    init(object: CompicationObject) {
        self.configuration = object.configuration
    }
    
    func clone() -> CompicationObject {
        return CompicationObject(object: self)
    }
}

    class WebManager {
        
        func getData(with url: URL) -> Data {
            return Data()
        }
        
    }

let object = CompicationObject(url: URL(fileURLWithPath: ""))
let clobe = object.clone()

print(object === clobe)

