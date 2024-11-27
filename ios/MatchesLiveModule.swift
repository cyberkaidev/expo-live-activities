//
//  MatchesLive.swift
//  myapp
//
//  Created by Kaique Dourado on 26/11/24.
//

import Foundation
import ActivityKit

@objc(MatchesLiveModule)
class MatchesLiveModule: NSObject {
  
  private func areActivitiesEnabled() -> Bool {
    return ActivityAuthorizationInfo().areActivitiesEnabled
  }
  
  @objc func startActivity() -> Void {
    if (!areActivitiesEnabled()) {
      // Caso o usuario não habilitar o Live Activities do app, vai cancelar o processo (evitará erros)
      return
    }
    
    // iOS com versões a baixo do 16.1 não tem suporte ao Live Activities
    if #available(iOS 16.1, *) {
      let matchesLiveAttributes = MatchesLiveAttributes(name: "Counter-Strike 2")
      let contentState = MatchesLiveAttributes.ContentState()
      let matchesLiveContentState = ActivityContent(state: contentState,  staleDate: nil)
      
      do {
            // Solicitação para iniciar uma nova Live Activities com o conteúdo definido acima
            try Activity.request(attributes: matchesLiveAttributes, content: matchesLiveContentState)
          } catch {
            print("startActivity error...")
          }
    } else {
      print("Dynamic Island and live activity not supported")
    }
  }
  
  // Aqui vamos receber duas props astralisPoint e spiritPoint que vão atualizar o estado do nosso Widet
  @objc func updateActivity(_ astralisPoint: String, spiritPoint: String) -> Void {
    do{
      if #available(iOS 16.1, *) {
        let matchesLiveContentState = MatchesLiveAttributes.ContentState(astralisPoint: astralisPoint, spiritPoint: spiritPoint)
        Task {
          for activity in Activity<MatchesLiveAttributes>.activities {
            await activity.update(ActivityContent<MatchesLiveAttributes.ContentState>(state: matchesLiveContentState,  staleDate: nil))
          }
        }
      }
    } catch(_) {
      print("updateActivity error...")
    }
  }
  
  @objc func endActivity() -> Void {
    // Uma Task é uma unidade de trabalho que pode ser executada simultaneamente em uma thread leve, gerenciado pelo tempo de execução do Swift
    // Ajuda a evitar o bloqueio do thread principal
    Task {
      for activity in Activity<MatchesLiveAttributes>.activities {
        await activity.end(nil, dismissalPolicy: .immediate)
      }
    }
  }
}

