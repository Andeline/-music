//
//  ViewController.swift
//  音樂常識選擇題
//
//  Created by 蔡佳穎 on 2021/5/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var aBtn: UIButton!
    @IBOutlet weak var bBtn: UIButton!
    @IBOutlet weak var cBtn: UIButton!
    @IBOutlet weak var dBtn: UIButton!
    
    var questions = [Question]()
    var index = 0
    var score = 0
    var answer = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(question: "下列哪一首作品不是柴科夫斯基(P. I. Tchaikovsky)的舞劇音樂?", optionA: "《胡桃鉗》", optionB: "《天鵝湖》", optionC: "《天方夜譚》", optionD: "《睡美人》", answer: "《天方夜譚》")
        questions.append(question1)
        let question2 = Question(question: "下列何者盛行於文藝復興時期?", optionA: "歌劇(Opera)", optionB: "神劇(Oratorio)", optionC: "牧歌(Madrigal)", optionD: "藝術歌曲(Lied)", answer: "牧歌(Madrigal)")
        questions.append(question2)
        let question3 = Question(question: "下列哪一位是弦樂四重奏《皇帝》的作曲家?", optionA: "貝多芬(L. v. Beethoven)", optionB: "莫札特(W. A. Mozart)", optionC: "韋瓦第(A.Vivaldi)", optionD: "海頓(F. J. Haydn)", answer: "貝多芬(L. v. Beethoven)")
        questions.append(question3)
        let question4 = Question(question: "下列哪一個是擊絃樂器?", optionA: "琵琶", optionB: "古琴", optionC: "揚琴", optionD: "二胡", answer: "揚琴")
        questions.append(question4)
        let question5 = Question(question: "同一個減三和弦可以出現在幾個和聲小音階中?", optionA: "一個", optionB: "二個", optionC: "三個", optionD: "四個", answer: "二個")
        questions.append(question5)
        let question6 = Question(question: "下列哪一臺灣原住民族有平行音唱法?", optionA: "鄒族", optionB: "太魯閣族", optionC: "卑南族", optionD: "撒奇萊雅族", answer: "鄒族")
        questions.append(question6)
        let question7 = Question(question: "下列何者不能等分一個完全八度?", optionA: "大二度", optionB: "小三度", optionC: "完全四度", optionD: "增四度(減五度)", answer: "完全四度")
        questions.append(question7)
        let question8 = Question(question: "A大調的下中音等同於", optionA: "e小調之關係調的導音", optionB: "E大調之屬調的中音", optionC: "B大調之關係調的下屬音", optionD: "D大調之下屬調的上主音", answer: "e小調之關係調的導音")
        questions.append(question8)
        let question9 = Question(question: "《嘸通嫌臺灣》是哪一位作曲家的作品?", optionA: "蕭泰然", optionB: "呂泉生", optionC: "江文也", optionD: "郭芝苑", answer: "蕭泰然")
        questions.append(question9)
        let question10 = Question(question: "下列哪一首是史托克豪森(K. Stockhausen)的作品?", optionA: "《愛因斯坦在沙灘上》", optionB: "《無主之槌》", optionC: "《青少年之歌》", optionD: "《為廣島受難者之輓歌》", answer: "《青少年之歌》")
        questions.append(question10)
        let question11 = Question(question: "下列何者為北管音樂?", optionA: "梅花操", optionB: "百鳥歸巢", optionC: "四時景", optionD: "風入松", answer: "風入松")
        questions.append(question11)
        let question12 = Question(question: "下列何者配對正確?", optionA: "印度—維納琴", optionB: "泰國—風笛", optionC: "蘇格蘭—烏德琴", optionD: "日本—杖鼓", answer: "印度—維納琴")
        questions.append(question12)
        let question13 = Question(question: "下列何者不是速度術語? ", optionA: "vivace", optionB: "sforzando", optionC: "meno mosso", optionD: "accelerando", answer: "sforzando")
        questions.append(question13)
        let question14 = Question(question: "下列哪一位作曲家之國籍與其他三人不同?", optionA: "巴爾托克(B. Bartók)", optionB: "柯大宜(Z. Kodály)", optionC: "李斯特(F. Liszt)", optionD: "法雅(M. de Falla)", answer: "法雅(M. de Falla)")
        questions.append(question14)
        let question15 = Question(question: "下列哪一首為音樂劇《艾薇塔》之選曲?", optionA: "〈阿根廷別為我哭泣〉", optionB: "〈為了藝術為了愛〉", optionC: "〈鬥牛士之歌〉", optionD: "〈公主徹夜未眠〉", answer: "〈阿根廷別為我哭泣〉")
        questions.append(question15)
        
        questions.shuffle()
        indexLabel.text = "♦第\(index+1)題♦"
        indexLabel.sizeToFit()
        questionLabel.text = questions[index].question
        questionLabel.frame = CGRect(x: 66, y: 131, width: 294, height: 60)
        questionLabel.sizeToFit()
        aBtn.setTitle(questions[index].optionA, for: .normal)
        bBtn.setTitle(questions[index].optionB, for: .normal)
        cBtn.setTitle(questions[index].optionC, for: .normal)
        dBtn.setTitle(questions[index].optionD, for: .normal)
        scoreLabel.text = "分數：\(score) / 100"
        scoreLabel.sizeToFit()
    }
    func alert() {
        let controller = UIAlertController(title: "要不要再玩一次呢？", message: "測測你的實力到哪！", preferredStyle: .alert)
        let YesAction = UIAlertAction(title: "Yes", style: .default) {_ in
            self.index = 0
            self.score = 0
            self.questions.shuffle()
            self.indexLabel.text = "♦第\(self.index+1)題♦"
            self.questionLabel.text = self.questions[self.index].question
            self.questionLabel.frame = CGRect(x: 66, y: 131, width: 294, height: 60)
            self.questionLabel.sizeToFit()
            self.aBtn.setTitle(self.questions[self.index].optionA, for: .normal)
            self.bBtn.setTitle(self.questions[self.index].optionB, for: .normal)
            self.cBtn.setTitle(self.questions[self.index].optionC, for: .normal)
            self.dBtn.setTitle(self.questions[self.index].optionD, for: .normal)
            self.aBtn.isEnabled = true
            self.bBtn.isEnabled = true
            self.cBtn.isEnabled = true
            self.dBtn.isEnabled = true
            self.scoreLabel.text = "分數：\(self.score) / 100"
        }
        let NOAction =  UIAlertAction(title: "NO", style: .default, handler: nil)
        controller.addAction(NOAction)
        controller.addAction(YesAction)
        present(controller, animated: true, completion: nil)
    }
    
    func next() {
        if index < 9 {
            index += 1
            indexLabel.text = "♦第\(index+1)題♦"
            indexLabel.sizeToFit()
            questionLabel.text = questions[index].question
            questionLabel.frame = CGRect(x: 66, y: 131, width: 294, height: 60)
            questionLabel.sizeToFit()
            aBtn.setTitle(questions[index].optionA, for: .normal)
            bBtn.setTitle(questions[index].optionB, for: .normal)
            cBtn.setTitle(questions[index].optionC, for: .normal)
            dBtn.setTitle(questions[index].optionD, for: .normal)
        } else {
            alert()
        }
    }
    
    func scoreText() {
        scoreLabel.text = "分數：\(score) / 100"
        scoreLabel.sizeToFit()
    }

    @IBAction func choiceAnswer(_ sender: UIButton) {
            if sender.currentTitle == questions[index].answer {
                score += 10
                scoreText()
                next()
            } else {
                scoreText()
                next()
            }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        index = 0
        score = 0
        questions.shuffle()
        indexLabel.text = "♦第\(index+1)題♦"
        questionLabel.text = questions[index].question
        questionLabel.frame = CGRect(x: 66, y: 131, width: 294, height: 60)
        questionLabel.sizeToFit()
        aBtn.setTitle(questions[index].optionA, for: .normal)
        bBtn.setTitle(questions[index].optionB, for: .normal)
        cBtn.setTitle(questions[index].optionC, for: .normal)
        dBtn.setTitle(questions[index].optionD, for: .normal)
        scoreLabel.text = "分數：\(score) / 100"
    }
}

