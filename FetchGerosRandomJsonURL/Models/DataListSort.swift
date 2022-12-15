//
//  DataListSort.swift
//  FetchGerosRandomJsonURL
//
//  Created by Yannick Brands on 15.12.22.
//

import Foundation

struct DataListSort: Hashable, Identifiable {
    
    let id: Int
    let name: String
    let sortDescriptors: [SortDescriptor<Dinos>]
    
    static let sorts: [DataListSort] = [
        DataListSort(id: 0,
                      name: "Date | Ascending",
                      sortDescriptors: [
                        SortDescriptor(\.date)
                      ]),
        DataListSort(id: 1,
                      name: "Date | Descending",
                      sortDescriptors: [
                        SortDescriptor(\.date, order: .reverse)
                      ]),
        DataListSort(id: 2,
                      name: "Title | Ascending",
                      sortDescriptors: [                                                                        SortDescriptor(\.title),                                                                        SortDescriptor(\.date)                                                                        ]),
        DataListSort(id: 3,
                      name: "Title | Descending",
                      sortDescriptors:[
                        SortDescriptor(\.title, order: .reverse),
                        SortDescriptor(\.date)
                      ]),
        DataListSort(id: 4,
                      name: "Group by Icon",
                      sortDescriptors: [
                        SortDescriptor(\.image),
                        SortDescriptor(\.date)
                      ])
    ]
    
    static var defaultSort: DataListSort { sorts[0] }

}

