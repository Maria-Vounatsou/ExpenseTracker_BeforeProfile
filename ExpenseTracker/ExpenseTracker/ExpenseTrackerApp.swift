//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Vounatsou, Maria on 13/9/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @State private var presentSideMenu = false
    let persistenceController = PersistenceController.shared
    
    // Initialize DataManager directly as a constant property
    let dataManager: DataManager
    
    // Initialize AddAmountViewModel using @StateObject
    @StateObject private var addAmountViewModel: AddAmountViewModel

    // Initialize DataManager and AddAmountViewModel in the init method
    init() {
        let context = persistenceController.container.viewContext
        let manager = DataManager(context: context)  // Initialize DataManager
        self.dataManager = manager                   // Assign to the property
        _addAmountViewModel = StateObject(wrappedValue: AddAmountViewModel(dataManager: manager))
    }
    
    var body: some Scene {
        WindowGroup {
            MenuTabbedView(expenseService: dataManager, addAmountViewModel: addAmountViewModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(dataManager)  // Inject dataManager as EnvironmentObject
        }
    }
}

