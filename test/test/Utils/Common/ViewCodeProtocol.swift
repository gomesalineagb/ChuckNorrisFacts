//
//  ViewCodeProtocol.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import Foundation

protocol ViewCode: AnyObject{
    func setupViews()
    func setupConstraints()
    func setupViewHierarchy()
    func setupAdditionalConfiguration()
}

extension ViewCode {
    
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    func setupAdditionalConfiguration() {}
}
