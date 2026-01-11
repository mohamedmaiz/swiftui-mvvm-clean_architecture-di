//
//  ExercisesViewModel.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 03/01/2026.
//
import Foundation
import Combine
import Core

final class PodcastsViewModel: ObservableObject {
    @Published var state: PodcastsViewState = .idle
    @Published var searchState: PodcastsViewState = .idle
    
    @Published var sections: [PodcastCategorySection] = []
    @Published var searchResults: [Podcast] = []
    @Published var searchQuery: String = ""
    
    
    private let podcastsUseCase: PodcastsUseCase
    private let router: PodcastsRouting
    private var cancellables: Set<AnyCancellable> = []
    
    
    init(podcastsUseCase: PodcastsUseCase , router: PodcastsRouting) {
        self.podcastsUseCase = podcastsUseCase
        self.router = router
        setupSearchDebounce()
    }
    
    func viewDidLoad(){
        fetchPodcasts()
    }
    
    func goToDetails(id: Int) {
        router.route(to: .details(id: id))
    }
}


private extension PodcastsViewModel {
    func fetchPodcasts() {
        state = .loading
        podcastsUseCase
            .fetchTechnologyPodcasts()
            .zip(
                podcastsUseCase.fetchEnglishPodcasts(),
                podcastsUseCase.fetchBusinessPodcasts(),
                podcastsUseCase.fetchTedTalksPodcasts()
            )
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {[weak self] completion in
                switch completion {
                case .finished :
                    print("Success : \(#function)")
                case .failure(let error) :
                    self?.state = .error(error: error.localizedDescription)
                }
            }, receiveValue: { [weak self] technology , english , business , tedPodcasts in
                guard let self else { return }
                self.state = .loaded
                self.sections = [
                    .init(title: "Technology", subTitle: "Based on your listening" , podcasts: technology),
                    .init(title: "Language Learning", subTitle: "Based on your listening" , podcasts: english),
                    .init(title: "Business", podcasts: business),
                    .init(title: "Ted Talks", podcasts: tedPodcasts)
                ]
            })
            .store(in: &cancellables)
    }
    
    func setupSearchDebounce() {
        $searchQuery
            .removeDuplicates()
            .handleEvents(receiveOutput: { [weak self] query in
                // in this operator i reset the search state when the user delete the serach input
                if query.isEmpty {
                    self?.searchState = .idle
                    self?.searchResults = []
                }
            })
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap{ [weak self] query in
                guard let self = self else {return Just<[Podcast]>([]) .eraseToAnyPublisher() }
                self.searchState = .loading
                return podcastsUseCase
                    .searchPodcasts(query: query)
                    .catch { error in
                        self.searchState = .error(error: error.localizedDescription)
                        return Just<[Podcast]>([]).eraseToAnyPublisher()
                    }
                    .eraseToAnyPublisher()
                
            }
            .sink(receiveCompletion:  {[weak self] completion in
                switch completion {
                case .finished :
                    print("Success : \(#function)")
                case .failure(let error) :
                    self?.searchState = .error(error: error.localizedDescription)
                }
                
            }, receiveValue: { [weak self] podcasts in
                guard let self = self else {return}
                self.searchResults.removeAll()
                if podcasts.count > 0 {
                    self.searchResults = podcasts
                    self.searchState = .loaded
                } else if podcasts.isEmpty && !self.searchQuery.isEmpty {
                    self.searchState = .empty
                } else {
                    self.searchState = .idle
                }
            })
            .store(in: &cancellables)
    }
    
}
