//
//  CategoryView.swift
//  TravelDemoSwiftUI
//
//  Created by Mohamed Bakr on 10/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct CategoryDetailsView: View {
    
    @State private var  isLoding = false
    @State var isAnmsin = true
    private let name: String
    @ObservedObject private var viewModel: CategoryViewModel
    
    init(name: String) {
        print("Loaded CategoryDetails View and making a network request for \(name)")
        self.name = name
        self.viewModel = .init(name: name)
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                VStack {
                    ActivityIndicatorView()
                        .redacted(reason: .placeholder)
                }
                .padding()
                .cornerRadius(8)
                
            } else {
                ZStack {
                    
                    if !viewModel.errorMessage.isEmpty {
                        VStack(spacing: 12) {
                            Image(systemName: "xmark.octagon.fill")
                                .font(.system(size: 64, weight: .semibold))
                                .foregroundColor(.red)
                            Text(viewModel.errorMessage)
                        }
                    }
                    
                    ScrollView {
                        ForEach(viewModel.places, id: \.self) { place in
                            VStack(alignment: .leading, spacing: 0) {
                                WebImage(url: URL(string: place.thumbnail))
                                    .resizable()
                                    .indicator(.activity)
                                    .transition(.fade(duration: 0.5))
                                    .scaledToFill()
                                
                                Text(place.name)
                                    .font(.system(size: 12, weight: .semibold))
                                    .padding()
                                
                            }.asTile()
                                .padding()
                        }
                        .redacted(reason: isAnmsin ?  .placeholder : .init())
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                isAnmsin = false
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle(name, displayMode: .inline)
    }
    
}

struct CategoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailsView(name: "Food")
        }
    }
}


