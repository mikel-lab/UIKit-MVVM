

import UIKit

final class TopicsCoordinator: Coordinator {
    var navigator: UINavigationController
        
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let topicsViewModel = TopicsViewModel(coordinator: self)
        let topicsViewController = TopicsViewController(viewModel: topicsViewModel)
        topicsViewController.title = "Topics"
        
        // TENEMOS QUE DECIRLE AL VIEWMODEL QUIEN IMPLEMENTA SU PROTOCOLO XK EN ESTE MODULO NO USAMOS CLOSURES
        topicsViewModel.view = topicsViewController
        
        navigator.pushViewController(topicsViewController, animated: false)
    }
    
    func onTapAddButton() {
        // CreateTopicCoordinator
        let createTopicCoordinator = CreateTopicCoordinator(navigator: navigator)
        createTopicCoordinator.start()
    }
    
    func didSelect(topicId: Int) {
        // DetailTopicCoordinator
        let topicDetailCoordinator = TopicDetailCoordinator(navigator: navigator, topicId: topicId)
        topicDetailCoordinator.start()
    }
}
