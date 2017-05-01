//
//  StatsViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit
import Charts

class StatsViewController: UIViewController {

    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var monButton: UIButton!
    @IBOutlet weak var tueButton: UIButton!
    @IBOutlet weak var wedButton: UIButton!
    @IBOutlet weak var thuButton: UIButton!
    @IBOutlet weak var friButton: UIButton!
    @IBOutlet weak var satButton: UIButton!
    @IBOutlet weak var sunButton: UIButton!
    
    @IBOutlet weak var dailyChartView: UIView!
    var searchForDate: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "STATSTICS"
        self.searchForDate = "MON"
        self.monButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
        self.dailyChartView.backgroundColor = UIColor(white:1, alpha: 0)
        self.drawDailyChart()
        self.drawChart()
        // Do any additional setup after loading the view.
    }
    
    func drawChart() {
        self.chartView.backgroundColor = UIColor(white:1, alpha: 0)
        
        let chart = BarChartView(frame: CGRect.init(x: 0, y: 0, width: self.chartView.frame.size.width, height: self.chartView.frame.size.height))
        var entries = [BarChartDataEntry]()
        let weeks = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"]
        let values = [10.0, 20.0, 30.0, 10.0, 40.0, 70.0, 80.0]
        
        for i in 0..<weeks.count {
            let entry = BarChartDataEntry(x: Double(i), y: values[i])
            entries.append(entry)
        }
        
        
        let chartDataSet = BarChartDataSet(values: entries, label: "")
        chartDataSet.colors = [UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 0.6)]

        self.setChartDataSet(data: BarChartData(dataSet: chartDataSet), chart: chart, x: weeks)
        
    }
    
    func setChartDataSet(data: BarChartData, chart: BarChartView, x: [String]) {
        data.setDrawValues(false)
        chart.data = data
        chart.noDataText = "No Chart Data Available"
        chart.drawValueAboveBarEnabled = false
        chart.isUserInteractionEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.borderColor = UIColor.lightGray
        chart.xAxis.labelPosition = .bottom
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.drawLabelsEnabled = false
        chart.xAxis.labelTextColor = UIColor.black
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.enabled = false
        chart.legend.enabled = false
        chart.chartDescription = nil
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: x)
        
        chart.animate(yAxisDuration: 1.0)
        self.chartView.addSubview(chart)
    }
    
    @IBAction func switchToDates(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.searchForDate = "MON"
            self.monButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
        
        case 1:
            self.searchForDate = "TUE"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
        
        case 2:
            self.searchForDate = "WED"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
            
        case 3:
            self.searchForDate = "THU"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
            
        case 4:
            self.searchForDate = "FRI"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
            
        case 5:
            self.searchForDate = "SAT"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            self.sunButton.setTitleColor(UIColor.darkGray, for: .normal)
            break
            
        case 6:
            self.searchForDate = "SUN"
            self.monButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.tueButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.wedButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.thuButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.friButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.satButton.setTitleColor(UIColor.darkGray, for: .normal)
            self.sunButton.setTitleColor(UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 1.0), for: .normal)
            break
        default: break
        
        }
        for view in self.dailyChartView.subviews {
            view.removeFromSuperview()
        }
        self.drawDailyChart()
    }
    
    func drawDailyChart() {
        self.dailyChartView.backgroundColor = UIColor(white:1, alpha: 0)
        
        let chart = LineChartView(frame: CGRect.init(x: 0, y: 0, width: self.dailyChartView.frame.size.width, height: self.dailyChartView.frame.size.height))
        var entries = [BarChartDataEntry]()
        
    
        let daily = ["9AM", "10AM", "11AM", "12PM", "1PM", "2PM", "3PM", "4PM", "5PM", "6PM", "7PM", "8PM", "9PM", "10PM", "11PM"]
        let values = [0.0, 3.0, 0.0, 5.0, 0.0, 0.0, 5.0, 10.0, 10.0, 15.0, 3.0, 10.0, 10.0, 20.0, 5.0]
        
        for i in 0..<daily.count {
            let entry = BarChartDataEntry(x: Double(i), y: values[i])
            entries.append(entry)
        }
        
        let set = LineChartDataSet(values: entries, label: "")
        set.drawCirclesEnabled = false
        set.drawCircleHoleEnabled = false
        set.mode = .cubicBezier
        
        set.colors = [UIColor.init(red: 255/255.0, green: 128/255.0, blue: 0/255.0, alpha: 0.7)]
    
        self.setDailyChartDataSet(data: LineChartData(dataSet: set), chart: chart, x: daily)
    }
    
    func setDailyChartDataSet(data: LineChartData, chart: LineChartView, x: [String]) {
        data.setDrawValues(false)
        chart.data = data
        chart.noDataText = "No Chart Data Available"
        chart.isUserInteractionEnabled = false
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.labelTextColor = UIColor.black
        chart.leftAxis.drawLabelsEnabled = false
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.drawGridLinesEnabled = false
        chart.rightAxis.drawLabelsEnabled = false
        chart.rightAxis.enabled = false
        chart.legend.enabled = false
        chart.chartDescription = nil
        chart.xAxis.valueFormatter = IndexAxisValueFormatter(values: x)
        chart.animate(xAxisDuration: 0.3)
        
        self.dailyChartView.addSubview(chart)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
