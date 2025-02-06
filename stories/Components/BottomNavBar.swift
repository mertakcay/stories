import SwiftUI

struct BottomNavBar: View {
    @Binding var selectedTab: Int
    @Binding var showPopup: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            BottomBarButton(
                imageName: "house.fill",
                title: "Home",
                action: { selectedTab = 0 },
                isSelected: selectedTab == 0
            )
            
            Spacer()
            
            BottomBarButton(
                imageName: "plus.circle.fill",
                title: "Create",
                action: { 
                    selectedTab = 1
                    showPopup = true
                },
                isSelected: selectedTab == 1
            )
            .scaleEffect(1.2)
            
            Spacer()
            
            BottomBarButton(
                imageName: "person.fill",
                title: "Profile",
                action: { selectedTab = 2 },
                isSelected: selectedTab == 2
            )
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 15)
        .background(
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color.kidsPalette.primary.opacity(0.2), radius: 15, x: 0, y: -10)
        )
        .padding(.horizontal)
    }
}

struct BottomBarButton: View {
    let imageName: String
    let title: String
    let action: () -> Void
    let isSelected: Bool
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: imageName)
                    .imageScale(.large)
                    .font(.system(size: 24))
                Text(title)
                    .font(.caption2)
                    .fontWeight(.medium)
            }
            .foregroundColor(isSelected ? Color.kidsPalette.primary : Color.kidsPalette.textSecondary)
            .frame(maxWidth: .infinity)
            .contentShape(Rectangle())
        }
    }
} 
