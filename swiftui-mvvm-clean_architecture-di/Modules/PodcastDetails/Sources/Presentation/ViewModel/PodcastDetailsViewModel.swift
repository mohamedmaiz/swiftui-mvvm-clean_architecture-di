//
//  PodcastDetailsViewModel.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Foundation
import Combine
import Core


final class PodcastDetailsViewModel: ObservableObject {
    @Published var details: PodcastDetails?
    @Published var state: PodcastDetailsViewState = .idle
    
    
    private let podcastDetailsUseCase: PodcastDetailsUseCase
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(podcastDetailsUseCase: PodcastDetailsUseCase) {
        self.podcastDetailsUseCase = podcastDetailsUseCase
    }
    
    func viewDidLoad(id: Int){
        fetchPodcastDetails(id: id)
    }
    
}


private extension PodcastDetailsViewModel {
    func fetchPodcastDetails(id: Int) {
        state = .loading
        
        podcastDetailsUseCase
            .fetchDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished :
                    print("Success : \(#function)")
                case .failure(let error) :
                    self?.state = .error(error: error.localizedDescription)
                }
            }, receiveValue: { [weak self] details in
                guard let self else { return }
                self.state = .loaded
                self.details = details
            }
            )
            .store(in: &cancellables)
    }
    
}
