import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress: Int
    var goal: Int
    var baseColor: Color
    var progressColor: Color
    var width: CGFloat = 30

    private var progressPercentage: Double {
        Double(progress) / Double(goal)
    }

    private var progressImage: Image {
        switch progress {
        case 0: return Image("ZZZ")
        case 1...49: return Image("turtle")
        case 50...99: return Image("rabbit")
        case 100: return Image("clap")
        default: return Image("ZZZ")
        }
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(baseColor.opacity(0.2), lineWidth: width)

            Circle()
                .trim(from: 0, to: CGFloat(progressPercentage))
                .stroke(progressColor, style: StrokeStyle(lineWidth: width, lineCap: .round))
                .rotationEffect(.degrees(-90))

            progressImage
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
        }
        .padding()
    }
}

#Preview {
    ProgressCircleView(progress: .constant(50), goal: 100, baseColor: .gray, progressColor: .C_1)
}
