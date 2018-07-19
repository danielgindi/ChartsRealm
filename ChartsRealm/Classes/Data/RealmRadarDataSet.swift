//
//  RealmRadarDataSet.swift
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

open class RealmRadarDataSet: RealmLineRadarDataSet, IRadarChartDataSet
{
    open override func initialize()
    {
        self.valueFont = NSUIFont.systemFont(ofSize: 13.0)
    }

    // MARK: - Data functions and accessors
    
    internal override func buildEntryFromResultObject(_ object: RLMObjectBase, x: Double) -> ChartDataEntry
    {
        if let object = object as? RLMObject
        {
            return RadarChartDataEntry(value: object[_yValueField!] as! Double)
        }
        else
        {
            return RadarChartDataEntry(value: (object as! Object)[_yValueField!] as! Double)
        }
    }
    
    // MARK: - Styling functions and accessors
    
    /// flag indicating whether highlight circle should be drawn or not
    /// **default**: false
    open var drawHighlightCircleEnabled: Bool = false
    
    /// - returns: `true` if highlight circle should be drawn, `false` ifnot
    open var isDrawHighlightCircleEnabled: Bool { return drawHighlightCircleEnabled }
    
    open var highlightCircleFillColor: NSUIColor? = NSUIColor.white
    
    /// The stroke color for highlight circle.
    /// If `nil`, the color of the dataset is taken.
    open var highlightCircleStrokeColor: NSUIColor?
    
    open var highlightCircleStrokeAlpha: CGFloat = 0.3
    
    open var highlightCircleInnerRadius: CGFloat = 3.0
    
    open var highlightCircleOuterRadius: CGFloat = 4.0
    
    open var highlightCircleStrokeWidth: CGFloat = 2.0
}
