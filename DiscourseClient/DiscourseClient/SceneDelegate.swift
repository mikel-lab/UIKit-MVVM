
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    lazy var appCoordinator: AppCoordinator = {
        guard let window = self.window else { fatalError() }
        let coordinator = AppCoordinator(window: window)
        return coordinator
    }()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let sceneWindow = UIWindow(windowScene: windowScene)
        window = sceneWindow
        appCoordinator.start()
    }
}

