

import UIKit

class CategoriesDetailViewController: UIViewController {

    @IBOutlet weak var categoryId: UILabel!
    
    @IBOutlet weak var categoryName: UILabel!
    
    let viewModel: CategoriesDetailViewModel
    
    init(viewModel: CategoriesDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "CategoriesDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        viewModel.fetchCategoryDetail()
    }


    func bindViewModel(){
        viewModel.onCategoryDetailSuccess = { [weak self] id, name in
            self?.hideLoading()
            self?.categoryId.text = id
            self?.categoryName.text = name
        }
        
        viewModel.onCategoryDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }

}
