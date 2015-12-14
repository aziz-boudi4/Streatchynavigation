//
//  ViewController.swift
//  Streatchynavigation
//
//  Created by aziz omar boudi  on 12/13/15.
//  Copyright © 2015 jogabo. All rights reserved.
//

import UIKit

enum Direction {
  case Down
  case Up
  case Unknown
}

class ViewController: UIViewController {
  @IBOutlet weak var jogaBallImageView: UIImageView!
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var header: UIView!
  @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var scrollView: UIScrollView!
  var lastOffset: CGFloat = 0.0
  var direction = Direction.Unknown
  var heightSaved: CGFloat = 0.0
  var lastTranslation: CGFloat = 0.0


  @IBOutlet weak var headerScrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    headerScrollView.contentSize = CGSizeMake(scrollView.contentSize.width,scrollView.frame.size.height);
    heightSaved = headerHeightConstraint.constant
    scrollView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


extension ViewController: UIScrollViewDelegate {

  func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    lastOffset = scrollView.contentOffset.y
  }
  func scrollViewDidScroll(scrollView: UIScrollView) {
    let offset = scrollView.contentOffset.y
    let translation = (lastOffset - offset)/100

    if lastOffset > offset { // Down
      if headerHeightConstraint.constant > (heightSaved + 50){ return }
      headerHeightConstraint.constant += translation
      direction = .Down
      if translation >= 0 && translation <= 2 { // start transform at 0+1 to avoid a small logo and stop at 2+1 to avoid a big logo
        jogaBallImageView.transform = CGAffineTransformMakeScale(translation+1, translation+1)
        lastTranslation = translation
      }
    } else { // UP
      let newTranslation = lastTranslation + translation
      if headerHeightConstraint.constant <= heightSaved {
        headerHeightConstraint.constant = heightSaved
        return
      }
      
      if newTranslation <= 2 && newTranslation >= 0 {
        jogaBallImageView.transform = CGAffineTransformMakeScale(newTranslation+1, newTranslation+1)
      } else {
        jogaBallImageView.transform = CGAffineTransformIdentity
      }
    }
    headerHeightConstraint.constant += translation
    direction = .Up
  }
}
