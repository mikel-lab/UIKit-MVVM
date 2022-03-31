
import UIKit

class UserDetailViewController: UIViewController {

    let viewModel: UserDetailViewModel
    
    @IBOutlet weak var userId: UILabel!
    
    @IBOutlet weak var userName: UILabel!
    
    
    init(viewModel: UserDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "UserDetailViewController", bundle: nil)
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
        viewModel.fetchUserDetail()
    }
    
    func bindViewModel(){
        viewModel.onUserDetailSuccess = { [weak self] id, name in
            self?.hideLoading()
            self?.userId.text = id
            self?.userName.text = name
        }
        
        viewModel.onUserDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }

}
