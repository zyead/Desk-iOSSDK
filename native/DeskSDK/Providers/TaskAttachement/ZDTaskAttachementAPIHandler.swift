//
//  ZDTaskAttachementProvoider.swift
//  ZohoDeskSDK
//
//  Created by rajesh-2098 on 09/05/18.
//  Copyright © 2018 rajesh-2098. All rights reserved.
//

import Foundation
@objc open class ZDTaskAttachmentAPIHandler:NSObject{
    
    @objc open static func listAllAttachments(_ orgId:String = String().getZDOrgId(),taskId:String = "",optionalParams:[String:AnyObject] = [String:AnyObject](),onComplition:@escaping (([ZDAttachment]?,Error?,Int)->())) -> Void{
        
        let path = String(format: URLPathConstants.TasksAttachments.listAllTaskAttchements, taskId)
        ZDAttachementProvoider.listAllAttachments(orgId, urlPath: path, parentId: taskId, parentType: .task, optionalParams: optionalParams, onComplition: onComplition)
        
    }
    
    @objc open static func createAttachement(_ orgId:String = String().getZDOrgId(),taskId:String,data:Data,fileName:String,onComplition:@escaping ((ZDAttachment?,Error?,Int)->())) -> URLRequest {
        let path = String(format: URLPathConstants.TasksAttachments.createTaskAttachment, taskId)
        return ZDAttachementProvoider.createAttachement(orgId, path: path, data: data, fileName: fileName, isPublic: false, parentId: taskId, parentType: .task, addPublicData: false, onComplition: onComplition)
    }
    
    @objc open static func deleteAttachment(_ orgId:String = String().getZDOrgId(),taskId:String,attachementId:String,onComplition:@escaping ((Error?,Int)->())) -> Void{
        
        let path = String(format: URLPathConstants.TasksAttachments.deleteTaskAttachment, taskId,attachementId)
        ZDAttachementProvoider.deleteAttachment(orgId, path: path, onComplition: onComplition)
        
    }
    
}
