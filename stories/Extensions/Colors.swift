import SwiftUI

extension Color {
    static let kidsPalette = KidsPalette()
    
    struct KidsPalette {
        let primary = Color(hex: "FF9EAA")      // Soft coral pink
        let secondary = Color(hex: "91C1FF")    // Soft sky blue
        let accent = Color(hex: "FFB347")       // Cheerful orange
        let background = Color(hex: "F5F7FF")   // Very light blue-white
        
        // Supporting colors
        let mint = Color(hex: "98D7C2")         // Soft mint green
        let lavender = Color(hex: "DABFFF")     // Light purple
        let sunshine = Color(hex: "FFE156")     // Soft yellow
        
        // Text colors
        let textPrimary = Color(hex: "524F6C")  // Soft dark blue
        let textSecondary = Color(hex: "8B87A2") // Muted purple-gray
    }
}

// Helper extension to create colors from hex values
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
} 