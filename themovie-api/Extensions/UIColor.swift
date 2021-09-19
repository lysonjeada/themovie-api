import UIKit

extension UIColor {
    private static func color(_ colorString: String, _ model: Model) -> UIColor {
        if(model == .rgb) { return from(rgb: colorString) }
        return from(argb: UInt(colorString, radix: 16)!)
    }
    
    static func fromRGBString(_ rgb: String) -> UIColor {
        let color = from(rgb: rgb)
        if #available(iOS 13.0, *) {
            return UIColor.init {
                if $0.userInterfaceStyle == .dark {
                    return color.darked()
                } else {
                    return color
                }
            }
        } else {
            return color
        }
    }
    
    public static func from(rgb: String?) -> UIColor {
        guard var mutableRgb = rgb else { return clear }
        mutableRgb.removeAll { $0 == "#" }
        return from(rgbValue: UInt(mutableRgb, radix: 16)!)
    }
    
    private static func from(rgbValue: UInt) -> UIColor {
        return from(argb: 0xFF000000 + rgbValue)
    }
    
    private static func from(argb argbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((argbValue & 0x00FF0000) >> 16) / 255.0,
            green: CGFloat((argbValue & 0x0000FF00) >> 8) / 255.0,
            blue: CGFloat(argbValue & 0x000000FF) / 255.0,
            alpha: CGFloat((argbValue & 0xFF000000) >> 24) / 255.0
        )
    }

    func withAlpha(_ alpha: CGFloat) -> UIColor {
        var H: CGFloat = 0, S: CGFloat = 0, B: CGFloat = 0

        if getHue(&H, saturation: &S, brightness: &B, alpha: nil) {
            return UIColor(hue: H, saturation: S, brightness: B, alpha: alpha)
        }
        return self
    }
    
    func darked(_ brightness: CGFloat = 0.7) -> UIColor {
        var H: CGFloat = 0, S: CGFloat = 0, B: CGFloat = 0, A: CGFloat = 0

        if self.getHue(&H, saturation: &S, brightness: &B, alpha: &A) {
          if B < 1.0 {
            return UIColor(hue: H, saturation: S, brightness: brightness, alpha: A)
          } else {
            return UIColor(hue: H, saturation: 0.45, brightness: brightness, alpha: A)
          }
        }
        return self
    }
    
    func highlighted() -> UIColor {
        var H: CGFloat = 0, A: CGFloat = 0

        if getHue(&H, saturation: nil, brightness: nil, alpha: &A) {
            return UIColor(hue: H, saturation: 0.35, brightness: 0.9, alpha: A)
        }
        return self
    }
    
    

    var hexString: String {
        let colorRef = cgColor.components
        let r = colorRef?[0] ?? 0
        let g = colorRef?[1] ?? 0
        let b = ((colorRef?.count ?? 0) > 2 ? colorRef?[2] : g) ?? 0

        return String(format: "#%02lX%02lX%02lX",
                lroundf(Float(r * 255)),
                lroundf(Float(g * 255)),
                lroundf(Float(b * 255))
        )
    }
    
    enum Model: Int {
        case rgb = 0
        case argb = 1
    }
}

public extension UIView {
    
    func dropShadow(radius: CGFloat = 1) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
        
        
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
}
