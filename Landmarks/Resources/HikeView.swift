/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

//MARK: Para mantener el codigo limpio y seguir modificando transicion
extension AnyTransition {
	static var moveAndFade: AnyTransition {
		.asymmetric(
			insertion: .move(edge: .trailing).combined(with: .opacity), //como aparece
			removal: .scale.combined(with: .opacity) //como se va
		)
	}
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = true

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
					withAnimation{ // (.easeInOut(duration: 4))  es para que aparezca el contenido
						showDetail.toggle()
					}
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
						.scaleEffect(showDetail ? 1.5 : 1) //Hace el boton mas largo cuando se abre
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
					.transition(.moveAndFade) //El detalle se muestra pasando de un lado a otro
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
