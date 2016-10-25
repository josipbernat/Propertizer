//
//  SourceEditorCommand.swift
//  Propertizer
//
//  Created by Josip Bernat on 25/10/2016.
//  Copyright © 2016 Josip Bernat. All rights reserved.
//

import Foundation
import XcodeKit

class SourceEditorCommand: NSObject, XCSourceEditorCommand {
    
    let PropertizerErrorDomain = "PropertizerErrorDomain"
    enum PropertizerErrorCode : Int {
        case InvalidFile
    }
    
    private enum PropertizerCommand : String {
        case StrongNonatomic = "com.josipbernat.PropertyAutocomplete.Propertizer.StrongNonatomic"
        case StrongAtomic = "com.josipbernat.PropertyAutocomplete.Propertizer.StrongAtomic"
        case WeakNonatomic = "com.josipbernat.PropertyAutocomplete.Propertizer.WeakNonatomic"
        case WeakAtomic = "com.josipbernat.PropertyAutocomplete.Propertizer.WeakAtomic"
        case ReadwriteNonatomic = "com.josipbernat.PropertyAutocomplete.Propertizer.ReadwriteNonatomic"
        case ReadwriteAtomic = "com.josipbernat.PropertyAutocomplete.Propertizer.ReadwriteAtomic"
        case Copy = "com.josipbernat.PropertyAutocomplete.Propertizer.Copy"
    }
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
        
        let buffer = invocation.buffer
        
        if buffer.contentUTI != kUTTypeObjectiveCSource as String {
            completionHandler(NSError(domain:PropertizerErrorDomain, code:PropertizerErrorCode.InvalidFile.rawValue, userInfo:[NSLocalizedDescriptionKey: "Selected file isn't Objective-C file"]))
        }
        else {
        
            if buffer.selections.count > 0 {
                
                if let insertionPoint = buffer.selections[0] as? XCSourceTextRange {
                    
                    let currentLine = insertionPoint.start.line
                    
                    switch invocation.commandIdentifier {
                    case PropertizerCommand.StrongNonatomic.rawValue:
                        buffer.lines.insert("@property(strong, nonatomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.StrongAtomic.rawValue:
                        buffer.lines.insert("@property(strong, atomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.WeakNonatomic.rawValue:
                        buffer.lines.insert("@property(weak, nonatomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.WeakAtomic.rawValue:
                        buffer.lines.insert("@property(weak, atomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.ReadwriteNonatomic.rawValue:
                        buffer.lines.insert("@property(readwrite, nonatomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.ReadwriteAtomic.rawValue:
                        buffer.lines.insert("@property(readwrite, atomic)<#statements#>;", at: currentLine)
                        
                    case PropertizerCommand.Copy.rawValue:
                        buffer.lines.insert("@property(copy)<#statements#>;", at: currentLine)
                        
                    default: break
                    }
                }
            }
            completionHandler(nil)
        }
    }
}
