//
//  ViewController.swift
//  Basketball scoreboard
//
//  Created by 王偉程 on 2021/12/24.
//

import UIKit

class ViewController: UIViewController {

    //節數.大小錶
    @IBOutlet weak var qtrLabel: UILabel!
    @IBOutlet weak var gameTimeLabel: UILabel!
    @IBOutlet weak var shotclockTimeLabel: UILabel!
    //主客隊分數
    @IBOutlet weak var homeScoreLabel: UILabel!
    @IBOutlet weak var guestScoreLabel: UILabel!
    //主客隊暫停犯規次數.
    @IBOutlet weak var hometimeoutLabel: UILabel!
    @IBOutlet weak var homefoulLabel: UILabel!
    @IBOutlet weak var guesttimeoutLabel: UILabel!
    @IBOutlet weak var guestfoulLabel: UILabel!
    
    @IBOutlet weak var starGameButton: UIButton!
    
    @IBOutlet weak var pauseGameButton: UIButton!
    
    @IBOutlet weak var gameresetButton: UIButton!
    @IBOutlet weak var nextqtrButton: UIButton!
    
    
    
    //宣告主客隊分數
    var homestartScore: Int = 0
    var homenowScore: Int = 0
    var homeScore:Int = 0
    
    var gueststartScore: Int = 0
    var guestnowScore: Int = 0
    var guestScore:Int = 0
    //宣告主客隊犯規暫停次數
    var homeiniTimeout:Int = 3
    var homeiniFouls:Int = 0
    var guestiniTimeout:Int = 3
    var guestiniFouls:Int = 0
    
    //宣告比賽時間
    var  gametimeTimer: Timer?
    var  shotClockTimer:Timer?
    var  gameminute = 12
    var  gamesecond = 0
    var  gamemillisecond = 0
    var  shotclock = 24
    var  shotclockmiliseond = 0
    var  foulshotclock = 12
    var  qtrArray = ["1st","2nd","3rd","4th"]
    var  i = 0
    var otArray = ["1ot","2ot","3ot","4ot"]
    var  j = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homefoulLabel.text = "\(homeiniFouls)"
        hometimeoutLabel.text = "\(homeiniTimeout)"
        guestfoulLabel.text = "\(guestiniFouls)"
        guesttimeoutLabel.text = "\(guestiniTimeout)"
        qtrLabel.text = "\(qtrArray[0])"
        // Do any additional setup after loading the view.
    }

    
    
    
    //比賽開始
    @IBAction func startgame(_ sender: Any) {
        gametimeTimer = Timer.scheduledTimer(timeInterval:0.01, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        shotClockTimer = Timer.scheduledTimer(timeInterval:0.01, target: self, selector: #selector(shotclockcountDown), userInfo: nil, repeats: true)
        starGameButton.isEnabled = false
        pauseGameButton.isEnabled = true
        gameresetButton.isEnabled = false
        nextqtrButton.isEnabled = false
    }
    //大錶倒數計時
    @objc func countDown() {
        if gamemillisecond == 0 && gamesecond == 0 && gameminute != 0 {
                gameminute -= 1
                gamesecond = 59
                gamemillisecond = 99
            if gameminute < 10 {
                gameTimeLabel.text = "0\(gameminute): \(gamesecond). \(gamemillisecond)"}
                else if gamesecond < 10 {
                    gameTimeLabel.text = "\(gameminute): 0\(gamesecond). \(gamemillisecond)"
                    }
                else if gamemillisecond < 10 {
                    gameTimeLabel.text = "\(gameminute): \(gamesecond). 0\(gamemillisecond)"
                    }
                else if gameminute < 10,gamesecond < 10,gamemillisecond < 10{
                    gameTimeLabel.text = "\(gameminute): 0\(gamesecond). 0\(gamemillisecond)"}
                else {
                    gameTimeLabel.text = "\(gameminute): \(gamesecond). \(gamemillisecond)"
                }
        }
            else if gamemillisecond != 0 && gamesecond != 0 && gameminute != 0  {
                gamemillisecond -= 1
                    if gamesecond < 10 {
                        gameTimeLabel.text = "\(gameminute): 0\(gamesecond). \(gamemillisecond)"}
                    else if gamemillisecond < 10 {
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). 0\(gamemillisecond)"
                    }else if gamesecond < 10 ,gamemillisecond < 10 {
                        gameTimeLabel.text = "0\(gameminute): 0\(gamesecond). \(gamemillisecond)"
                    }else{
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). \(gamemillisecond)"
                    }
              
        }
            else if gamemillisecond != 0 && gamesecond == 0 && gameminute != 0{
                gamemillisecond -= 1
                    if gamesecond < 10 {
                        gameTimeLabel.text = "\(gameminute): 0\(gamesecond). \(gamemillisecond)"}
                    else if gamemillisecond < 10 {
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). 0\(gamemillisecond)"
                    }else if gamesecond < 10 ,gamemillisecond < 10 {
                        gameTimeLabel.text = "0\(gameminute): 0\(gamesecond). \(gamemillisecond)"
                    }else{
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). \(gamemillisecond)"
                    }
                
            }
                else if gamemillisecond == 0 && gamesecond != 0 && gameminute != 0  {
                    gamesecond -= 1
                    gamemillisecond = 99

                    if gamemillisecond < 10 {
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). 0\(gamemillisecond)"
                    }else {
                        gameTimeLabel.text = "\(gameminute): \(gamesecond). \(gamemillisecond)"
                    }
                    
                }
        
        }
    
    
    //小錶倒數計時
    @objc func shotclockcountDown() {
        if shotclock != 0 && shotclockmiliseond == 0 {
            shotclock -= 1
            shotclockmiliseond = 99
            shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
        }else if shotclock != 0 && shotclockmiliseond != 0{
                shotclockmiliseond -= 1
                shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
        }else if shotclock == 0 && shotclockmiliseond != 0 {
                shotclockmiliseond -= 1
                shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
            }
        else {
            shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
        }
    }
    
    
    //比賽暫停
    
    @IBAction func gamepause(_ sender: Any) {
        gametimeTimer?.invalidate()
        shotClockTimer?.invalidate()
        starGameButton.isEnabled = true
        pauseGameButton.isEnabled = false
        gameresetButton.isEnabled = true
        nextqtrButton.isEnabled = true
    }
    
    //小錶重置
    @IBAction func shotclockreset(_ sender: Any) {
        
        shotclock = 24
        shotclockmiliseond = 00
        shotClockTimer?.invalidate()
        shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
        shotclockTimeLabel.font = UIFont(name: "digital-7", size: 20)
    }
   
    //下一節
    @IBAction func nextqtr(_ sender: Any) {
        i += 1
        if i == 4 {
            i = 0
            qtrLabel.text = "\(qtrArray[i])"
        }else {
            qtrLabel.text = "\(qtrArray[i])"
        }
        resttime()
        restfoultimeout()
    }
    //延長賽
    @IBAction func ot(_ sender: Any) {
        j += 1
        if j == 4 {
            j = 0
            qtrLabel.text = "\(otArray[j])"
        }else {
            qtrLabel.text = "\(otArray[j])"
        }
        ot()
    }
   
    //主客隊得分
    @IBAction func homethreepointsButton(_ sender: Any) {
        homenowScore = homeScore + 3
        homeScore = homestartScore + homenowScore
        homeScoreLabel.text = "\(homeScore)"
        if homeScore < 10 {
            homeScoreLabel.text = "0\(homeScore)"
        }
    }
    
    @IBAction func hometwopointsButton(_ sender: Any) {
        homenowScore = homeScore + 2
        homeScore = homestartScore+homenowScore
        homeScoreLabel.text = "\(homeScore)"
        if homeScore < 10 {
            homeScoreLabel.text = "0\(homeScore)"
        }
        
    }
    
    @IBAction func homefreethrowButton(_ sender: Any) {
        homenowScore = homeScore + 1
        homeScore = homestartScore+homenowScore
        homeScoreLabel.text = "\(homeScore)"
        if homeScore < 10 {
            homeScoreLabel.text = "0\(homeScore)"
        }
        
        
    }
    
    @IBAction func homescore1(_ sender: Any) {
        homenowScore = homeScore - 1
        homeScore = homestartScore+homenowScore
        homeScoreLabel.text = "\(homeScore)"
        if homeScore < 10 {
            homeScoreLabel.text = "0\(homeScore)"
        }
        
        
    }
    
    @IBAction func guestthreepointsButton(_ sender: Any) {
        guestnowScore = guestScore + 3
        guestScore = gueststartScore + guestnowScore
        guestScoreLabel.text = "\(guestScore)"
        if guestScore < 10 {
            guestScoreLabel.text = "0\(guestScore)"
        }
        
        
    }
    
    @IBAction func guesttwopointsButton(_ sender: Any) {
        guestnowScore = guestScore + 2
        guestScore = gueststartScore + guestnowScore
        guestScoreLabel.text = "\(guestScore)"
        if guestScore < 10 {
            guestScoreLabel.text = "0\(guestScore)"
        }
        
        
    }
    
    @IBAction func guestfreethrowButton(_ sender: Any) {
        
        guestnowScore = guestScore + 1
        guestScore = gueststartScore + guestnowScore
        guestScoreLabel.text = "\(guestScore)"
        if guestScore < 10 {
            guestScoreLabel.text = "0\(guestScore)"
        }
        
    }
    
    @IBAction func guestscore1(_ sender: Any) {
        
        guestnowScore = guestScore - 1
        guestScore = gueststartScore + guestnowScore
        guestScoreLabel.text = "\(guestScore)"
        if guestScore < 10 {
            guestScoreLabel.text = "0\(guestScore)"
        }
        
    }
    
    
    //主客隊暫停犯規
    @IBAction func hometimeoutincreaseButton(_ sender: Any) {
        homeiniTimeout += 1
        hometimeoutLabel.text = "\(homeiniTimeout)"
    }
    
    @IBAction func hometimeoutdecreaseButton(_ sender: Any) {
        homeiniTimeout -= 1
        hometimeoutLabel.text = "\(homeiniTimeout)"
    }
    

    @IBAction func homefoulincreaseButton(_ sender: Any) {
        homeiniFouls += 1
        homefoulLabel.text = "\(homeiniFouls)"
        if homeiniFouls >= 5 {
            homefoulLabel.textColor = .systemRed}
        else {
            homefoulLabel.textColor = .black
        }
    }
    
    @IBAction func homefouldecreaseButton(_ sender: Any) {
        homeiniFouls -= 1
        homefoulLabel.text = "\(homeiniFouls)"
        if homeiniFouls <= 4 {
            homefoulLabel.textColor = .black
        }else {
            homefoulLabel.textColor = .systemRed
        }
    }
    
    @IBAction func guesttimeoutincreaseButton(_ sender: Any) {
        guestiniTimeout += 1
        guesttimeoutLabel.text = "\(guestiniTimeout)"
    }
    
    @IBAction func guesttimeoutdecreaseButton(_ sender: Any) {
        guestiniTimeout -= 1
        guesttimeoutLabel.text = "\(guestiniTimeout)"
    }
    
    @IBAction func guestfoulincreaseButton(_ sender: Any) {
        guestiniFouls += 1
        guestfoulLabel.text = "\(guestiniFouls)"
        if guestiniFouls >= 5 {
            guestfoulLabel.textColor = .systemRed
        }else {
            guestfoulLabel.textColor = .black
            
        }
    }
    
    @IBAction func guestfouldecreaseButton(_ sender: Any) {
        guestiniFouls -= 1
        guestfoulLabel.text = "\(guestiniFouls)"
        if guestiniFouls <= 4 {
            guestfoulLabel.textColor = .black
        }else {
            guestfoulLabel.textColor = .systemRed
        }
    }
    
    
    
    
    
    //犯規暫停重置
    @IBAction func foultiomeoutresetButton(_ sender: Any) {
        restfoultimeout()
    }
    
    //比賽重置
    @IBAction func gamereset(_ sender: Any) {
        restgame()
        qtrLabel.text = "1st"
        i = 0
        j = -1
    }
    
    
    
    
    
    
    
    
    
    
    func restfoultimeout() {
        homeiniTimeout = 3
        homeiniFouls = 0
        guestiniTimeout = 3
        guestiniFouls = 0
        hometimeoutLabel.text = "\(homeiniTimeout)"
        homefoulLabel.text = "\(homeiniFouls)"
        homefoulLabel.textColor = .black
        guesttimeoutLabel.text = "\(guestiniTimeout)"
        guestfoulLabel.text = "\(guestiniFouls)"
        guestfoulLabel.textColor = .black
    }
    
    func restgame() {
         gameminute = 12
         gamesecond = 00
         gamemillisecond = 0
         shotclock = 24
         shotclockmiliseond = 0
         homeiniTimeout = 3
         homeiniFouls = 0
         guestiniTimeout = 3
         guestiniFouls = 0
         homeScore = 0
        guestScore = 0
         gameTimeLabel.text = "\(gameminute):\(gamesecond):\(gamemillisecond)"
         shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
         homeScoreLabel.text = "\(homeScore)"
         guestScoreLabel.text = "\(guestScore)"
        hometimeoutLabel.text = "\(homeiniTimeout)"
        homefoulLabel.text = "\(homeiniFouls)"
        guesttimeoutLabel.text = "\(guestiniTimeout)"
        guestfoulLabel.text = "\(guestiniFouls)"
    }
    func resttime() {
        gameminute = 12
        gamesecond = 00
        gamemillisecond = 0
        shotclock = 24
        shotclockmiliseond = 0
        gameTimeLabel.text = "\(gameminute):\(gamesecond):\(gamemillisecond)"
        shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
    }
    
    func ot() {
        gameminute = 05
        gamesecond = 00
        gamemillisecond = 0
        shotclock = 24
        shotclockmiliseond = 0
        gameTimeLabel.text = "\(gameminute):\(gamesecond):\(gamemillisecond)"
        shotclockTimeLabel.text = "\(shotclock).\(shotclockmiliseond)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

