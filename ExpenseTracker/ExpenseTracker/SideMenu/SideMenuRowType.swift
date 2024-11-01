//
//  SideMenuRowType.swift
//  ExperimentApp
//
//  Created by Vounatsou, Maria on 9/9/24.
//
import SwiftUI

enum SideMenuRowType: Int, CaseIterable {
    case expense = 0
    case addExpense
    case unknown
    
    var title: String {
        switch self {
        case .expense:
            return "Expense"
        case .addExpense:
            return "AddExpense"
        case .unknown:
            return "unknown"
        }
    }
    
    var iconName: String {
        switch self {
        case .expense:
            return "pieChart"
        case .addExpense:
            return "gear"
        case .unknown:
            return "game"
        }
    }
}

