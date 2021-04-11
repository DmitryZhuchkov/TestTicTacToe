//
//  GameController.swift
//  TicTacToe
//
//  Created by Дмитрий Жучков on 08.04.2021.
//

import UIKit
class GameController: UIViewController {
    @IBOutlet weak var GameView: UIView!
    @IBOutlet weak var First1: UIButton!
    @IBOutlet weak var First2: UIButton!
    @IBOutlet weak var First3: UIButton!
    @IBOutlet weak var Second1: UIButton!
    @IBOutlet weak var Second2: UIButton!
    @IBOutlet weak var Second3: UIButton!
    @IBOutlet weak var Third1: UIButton!
    @IBOutlet weak var Third2: UIButton!
    @IBOutlet weak var Third3: UIButton!
    var board: [[Int]] = [[Int]](repeating: [Int](repeating: 3, count: 3), count: 3)
    var turn: Int = 1
    var totalturn: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func buttonEvent(button: UIButton, x: Int, y: Int) {
        if button.currentImage == nil {
            if turn == 1 {
                button.setImage( UIImage(named: "X"), for: .normal)
                board[x][y] = turn
                turn = 2
                totalturn += 1
            }
            else {
                button.setImage( UIImage(named: "0"), for: .normal)
                board[x][y] = turn
                turn = 1
                totalturn += 1
            }
        }
    }
    func close(_ sender:Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func printWinner(){
        let winner: Int = checkWinner()
        if winner == 1 {
            let alert = UIAlertController( title: "Winning", message: "X win", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler:  close(_:)))
                 self.present(alert, animated: true, completion: nil)
        }
        else if winner == 2 {
            let alert = UIAlertController( title: "Winning", message: "O win", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: close(_:)))
            self.present(alert, animated: true, completion: nil)
        }
        else if totalturn == 9 && winner == -1 {
            let alert = UIAlertController( title: "", message: "Draw", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.default, handler: close(_:)))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func checkWinner() -> Int {
        var winner: Int = -1
        var rowcheckable: Bool = true
        var colcheckable: Bool = true
        var diag1checkable: Bool = true
        var diag2checkable: Bool = true
        
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if rowcheckable && board[i][0] != board[i][j]  {
                    rowcheckable = false
                }
                if colcheckable && board[0][i] != board[j][i] {
                    colcheckable = false
                }
                if diag1checkable && board[0][0] != board[j][j] {
                    diag1checkable = false
                }
                if diag2checkable && board[0][board.count-1] != board[j][board.count-1-j] {
                    diag2checkable = false
                }
            }
            if rowcheckable {
                winner = board[i][0]
            }
            if colcheckable {
                winner = board[0][i]
            }
            if diag1checkable {
                winner = board[0][0]
            }
            if diag2checkable {
                winner = board[0][board.count-1]
            }
            
            if rowcheckable||colcheckable||diag1checkable||diag2checkable {
                break
            }
            else {
                rowcheckable = true
                colcheckable = true
            }
        }
        return winner
    }
    
    @IBAction func one1Tapped(_ sender: UIButton) {
        buttonEvent(button: First1, x: 0, y: 0)
        printWinner()
    }
    @IBAction func one2Tapped(_ sender: UIButton) {
        buttonEvent(button: First2, x: 0, y: 1)
        printWinner()
    }
    @IBAction func one3Tapped(_ sender: UIButton) {
        buttonEvent(button: First3, x: 0, y: 2)
        printWinner()
    }
    @IBAction func two1Tapped(_ sender: UIButton) {
        buttonEvent(button: Second1, x: 1, y: 0)
        printWinner()
    }
    @IBAction func two2Tapped(_ sender: UIButton) {
        buttonEvent(button: Second2, x: 1, y: 1)
        printWinner()
    }
    @IBAction func two3Tapped(_ sender: UIButton) {
        buttonEvent(button: Second3, x: 1, y: 2)
        printWinner()
    }
    @IBAction func three1Tapped(_ sender: UIButton) {
        buttonEvent(button: Third1, x: 2, y: 0)
        printWinner()
    }
    @IBAction func three2Tapped(_ sender: UIButton) {
        buttonEvent(button: Third2, x: 2, y: 1)
        printWinner()
    }
    @IBAction func three3Tapped(_ sender: UIButton) {
        buttonEvent(button: Third3, x: 2, y: 2)
        printWinner()
    }
}
