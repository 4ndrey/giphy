//
//  DetailsPresenter.swift
//  Giphy
//
//  Created by Andrey Toropchin on 25.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class DetailsPresenter {

    weak var output: DetailsPresenterOutput?

    private let repository: GifsRepository
    fileprivate let dataMapper = GifDetailsModelDataMapper()
    fileprivate let getGifDetails: GetGifDetails

    init(repository: GifsRepository) {
        self.repository = repository
        getGifDetails = GetGifDetails(repository: repository)
    }
}

extension DetailsPresenter: DetailsPresenterInput {
    func getGifDetails(model: GifModel) {
        BackgroundTask.execute {
            do {
                let gif = try self.getGifDetails.execute(params: model.id)
                let model = try self.dataMapper.transform(gif: gif)
                MainTask.execute {
                    self.output?.showGifDetails(model: model)
                }
            }
            catch (let error) {
                MainTask.execute {
                    let message = error is String ? error as! String : error.localizedDescription
                    self.output?.showError(message: message)
                }
            }
        }
    }
}
