//
//  RealmBubbleDataSet.swift
//  Charts
//
//  Copyright 2015 Daniel Cohen Gindi & Philipp Jahoda
//  A port of MPAndroidChart for iOS
//  Licensed under Apache License 2.0
//
//  https://github.com/danielgindi/Charts
//

import Foundation
import CoreGraphics
import Charts
import Realm
import RealmSwift
import Realm.Dynamic

open class RealmBubbleDataSet: RealmBarLineScatterCandleBubbleDataSet, IBubbleChartDataSet
{
    open override func initialize()
    {
    }
    
    public required init()
    {
        super.init()
    }
    
    @objc public init(results: RLMResults<RLMObject>?, xValueField: String, yValueField: String, sizeField: String, label: String?)
    {
        _sizeField = sizeField
        
        super.init(results: results, xValueField: xValueField, yValueField: yValueField, label: label)
    }
    
    public convenience init(results: Results<Object>?, xValueField: String, yValueField: String, sizeField: String, label: String?)
    {
        var converted: RLMResults<RLMObject>?
        
        if results != nil
        {
            converted = ObjectiveCSupport.convert(object: results!) as? RLMResults<RLMObject>
        }
        
        self.init(results: converted, xValueField: xValueField, yValueField: yValueField, sizeField: sizeField, label: label)
    }
    
    @objc public convenience init(results: RLMResults<RLMObject>?, xValueField: String, yValueField: String, sizeField: String)
    {
        self.init(results: results, xValueField: xValueField, yValueField: yValueField, sizeField: sizeField, label: "DataSet")
    }
    
    public convenience init(results: Results<Object>?, xValueField: String, yValueField: String, sizeField: String)
    {
        var converted: RLMResults<RLMObject>?
        
        if results != nil
        {
            converted = ObjectiveCSupport.convert(object: results!) as? RLMResults<RLMObject>
        }
        
        self.init(results: converted, xValueField: xValueField, yValueField: yValueField, sizeField: sizeField)
    }
    
    @objc public init(realm: RLMRealm?, modelName: String, resultsWhere: String, xValueField: String, yValueField: String, sizeField: String, label: String?)
    {
        _sizeField = sizeField
        
        super.init(realm: realm, modelName: modelName, resultsWhere: resultsWhere, xValueField: xValueField, yValueField: yValueField, label: label)
    }
    
    public convenience init(realm: Realm?, modelName: String, resultsWhere: String, xValueField: String, yValueField: String, sizeField: String, label: String?)
    {
        var converted: RLMRealm?
        
        if realm != nil
        {
            converted = ObjectiveCSupport.convert(object: realm!)
        }
        
        self.init(realm: converted, modelName: modelName, resultsWhere: resultsWhere, xValueField: xValueField, yValueField: yValueField, sizeField: sizeField, label: label)
    }
    
    // MARK: - Data functions and accessors
    
    @objc internal var _sizeField: String?
    
    @objc internal var _maxSize = CGFloat(0.0)
    
    open var maxSize: CGFloat { return _maxSize }
    @objc open var normalizeSizeEnabled: Bool = true
    open var isNormalizeSizeEnabled: Bool { return normalizeSizeEnabled }
    
    internal override func buildEntryFromResultObject(_ object: RLMObject, x: Double) -> ChartDataEntry
    {
        let entry = BubbleChartDataEntry(x: _xValueField == nil ? x : object[_xValueField!] as! Double, y: object[_yValueField!] as! Double, size: object[_sizeField!] as! CGFloat)
        
        return entry
    }
    
    open override func calcMinMax()
    {
        if _cache.count == 0
        {
            return
        }
        
        _yMax = -Double.greatestFiniteMagnitude
        _yMin = Double.greatestFiniteMagnitude
        _xMax = -Double.greatestFiniteMagnitude
        _xMin = Double.greatestFiniteMagnitude
        
        for e in _cache as! [BubbleChartDataEntry]
        {
            calcMinMax(entry: e)
            
            let size = e.size
            
            if size > _maxSize
            {
                _maxSize = size
            }
        }
    }
    
    // MARK: - Styling functions and accessors
    
    /// Sets/gets the width of the circle that surrounds the bubble when highlighted
    open var highlightCircleWidth: CGFloat = 2.5
    
    // MARK: - NSCopying
    
    open override func copy(with zone: NSZone? = nil) -> Any
    {
        let copy = super.copy(with: zone) as! RealmBubbleDataSet
        copy._xMin = _xMin
        copy._xMax = _xMax
        copy._maxSize = _maxSize
        copy.highlightCircleWidth = highlightCircleWidth
        return copy
    }
}
