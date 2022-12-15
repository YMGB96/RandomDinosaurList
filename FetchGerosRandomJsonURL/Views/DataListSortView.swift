//
//  DataListSortView.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 15.12.22.
//

import SwiftUI

struct DataListSortView: View {
    
    @Binding var selectedSortRule: DataListSort
    let sorts: [DataListSort]
    
    var body: some View {
        Menu {
            Picker("Sort by", selection: $selectedSortRule) {
                ForEach(sorts, id: \.self) { sort in
                    Text("\(sort.name)")
                }
            }
        } label: {
        Image(systemName: "line.3.horizontal.decrease.circle.fill")
                .imageScale(.large)
        }
        .pickerStyle(.inline)
    }
}

struct DataListSortView_Previews: PreviewProvider {
    @State static var sort = DataListSort.defaultSort
    static var previews: some View {
        DataListSortView(selectedSortRule: $sort, sorts: DataListSort.sorts)
    }
}
