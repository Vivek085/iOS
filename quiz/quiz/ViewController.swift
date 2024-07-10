import UIKit

class ViewController: UIViewController {
    @IBOutlet var qus: UILabel!

    @IBOutlet weak var tbxans: UITextField!
    @IBOutlet var ans: UILabel!
    let questions: [String] = [
        "What is 7+7 ?",
        "What is the capital of Bharat ?",
        "What is wine made from ?"
    ]
    let answers: [String] = [
        "14",
        "Del",
        "Grapes"
    ]
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let MyColor = UIColor.white
        tbxans.layer.borderColor = MyColor.cgColor
        tbxans.layer.cornerRadius = 21.0
        
        tbxans.layer.borderWidth = 1.5
        
        qus.text=questions[currentQuestionIndex]
    }
    @IBAction func nextqusbtn(_ sender: Any) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        qus.text = question
        ans.text = "?"
    }
    
    
    @IBAction func showans(_ sender: Any) {
        let answer: String = answers[currentQuestionIndex]
        ans.text = answer
    }
    
}

