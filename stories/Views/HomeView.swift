import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0..<5) { _ in
                    StoryCard()
                }
            }
            .padding()
        }
    }
}

struct StoryCard: View {
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.title)
                    .foregroundColor(.kidsPalette.secondary)
                
                VStack(alignment: .leading) {
                    Text("John Doe")
                        .font(.headline)
                        .foregroundColor(.kidsPalette.textPrimary)
                    Text("2 hours ago")
                        .font(.caption)
                        .foregroundColor(.kidsPalette.textSecondary)
                }
                
                Spacer()
            }
            
            Text("Tonight, I followed my bedtime routine perfectly. I dimmed the lights, did some light stretching, and read a few pages of my favorite book. It helped me fall asleep faster than usual. I also made sure to avoid screens for an hour before bed, which really helped calm my mind. The room temperature was perfect, and I used my lavender essential oil diffuser. I'm starting to see a pattern - when I stick to this routine, I fall asleep much more easily.")
                .font(.body)
                .foregroundColor(.kidsPalette.textPrimary)
                .lineLimit(isExpanded ? nil : 3)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        isExpanded.toggle()
                    }
                }
            
            if !isExpanded {
                Text("Read more")
                    .font(.caption)
                    .foregroundColor(.kidsPalette.secondary)
                    .padding(.top, -8)
            }
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "heart")
                        .foregroundColor(.kidsPalette.primary)
                }
                
                Text("24")
                    .font(.subheadline)
                    .foregroundColor(.kidsPalette.textSecondary)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "bookmark")
                        .foregroundColor(.kidsPalette.secondary)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white)
                .shadow(color: .kidsPalette.primary.opacity(0.1), radius: 10, x: 0, y: 2)
        )
        .animation(.easeInOut, value: isExpanded)
    }
} 