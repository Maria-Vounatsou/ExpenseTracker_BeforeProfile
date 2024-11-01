//
//  MainTabbedView.swift
//  ExperimentApp
//
//  Created by Vounatsou, Maria on 9/9/24.
//

import SwiftUI
import CoreData

struct MenuTabbedView: View {
    
    @State var presentSideMenu = false
    @State var selectedSideMenuTab = 0
    @Environment(\.managedObjectContext) private var viewContext
    
    @ObservedObject var expenseService: DataManager
    @ObservedObject var addAmountViewModel: AddAmountViewModel
  
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                ExpenseView(presentSideMenu: $presentSideMenu, dataManager: expenseService)
                    .tag(0)
                AddAmountView(presentSideMenu: $presentSideMenu, viewModel: addAmountViewModel) // Remove 'expenseService'
                    .tag(1)
            }
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
    }
}


struct MenuTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        // Set up the preview managed object context
        let context = PersistenceController.preview.container.viewContext
        
        // Create an instance of the DataManager
        let expenseService = DataManager(context: context)
        
        // Create the ViewModel, passing the DataManager
        let addAmountViewModel = AddAmountViewModel(dataManager: expenseService)
        
        // Return the MenuTabbedView with the necessary view models
        return MenuTabbedView(expenseService: expenseService, addAmountViewModel: addAmountViewModel)
            .environment(\.managedObjectContext, context)
    }
}
