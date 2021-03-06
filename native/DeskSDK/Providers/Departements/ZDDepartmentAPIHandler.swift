//
//  ZDDepartmentProvoider.swift
//  Pods
//
//  Created by rajeshkumar.l on 30/10/17.
//
//

import Foundation

@objc open class ZDDepartmentAPIHandler: NSObject {
    
    @objc open static func getDepartment(_ orgId:String = String().getZDOrgId(),departmentId:String,onComplition:@escaping ((ZDDepartment?,Error?,Int)->())) -> Void{
        
        let request = ZDBaseRequest(path: String(format: URLPathConstants.Departments.getADepartment, departmentId),headers:["orgId":orgId])
        ZDBaseRequester.getJsonDicReponce(baseRequest: request) { (json, reponceData, error, status) in
            onComplition(ZDDepartment(departmentJsonReponce: json, orgId: orgId), error, status)
        }
    }
    
    @objc open static func listAllDepartments(_ orgId:String = String().getZDOrgId(),optionalParams:[String:AnyObject] = [String:AnyObject](),onComplition:@escaping (([ZDDepartment]?,Error?,Int)->())) -> Void{
        
        let request = ZDBaseRequest(path: URLPathConstants.Departments.listAllDepartments,parameters:optionalParams,headers:["orgId":orgId])
        ZDBaseRequester.getJsonDicReponce(baseRequest: request) {
            (json, reponceData, error, status) in
            onComplition(ZDDepartment.modelsFromDictionaryArray(dic: json, orgId: orgId), error, status)
        }
    }
}
