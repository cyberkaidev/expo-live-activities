//
//  MatchesLiveLiveActivity.swift
//  MatchesLive
//
//  Created by Kaique Dourado on 26/11/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

// Encare esse struct como um Model do nosso Widget
struct MatchesLiveAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    // Aqui são nossos estados dinamicos, encare isso como o useState do React
    var astralisPoint: String?
    var spiritPoint: String?
  }

  // Aqui é nosso estado fixo
  var name: String
}

// Aqui vamos criar nosso Widget que será exibido na barra de status, tela de notificação e de bloqueio
struct MatchesLiveLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: MatchesLiveAttributes.self) { context in
      VStack {
        VStack {
          HStack {
            VStack {
              Image("IconAstralis")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
              Text(context.state.astralisPoint ?? "0")
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            }.padding(.leading, 20)
            VStack {
              Text("Cache").foregroundStyle(Color.white)
              Text(
                Date(timeIntervalSinceNow: 0),
                style: .timer
              )
              .foregroundStyle(Color.white)
              .fontWeight(.bold)
              .monospacedDigit()
              .multilineTextAlignment(.center)
            }
            VStack {
              Image("IconSpirit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
              Text(context.state.spiritPoint ?? "0")
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
            }.padding(.trailing, 20)
          }
          HStack {
            VStack {
              Text("Pick: Astralis")
                .font(.system(size: 12))
                .foregroundStyle(Color.white)
              Text("Cache")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundStyle(Color.white)
            }
            VStack {
              Text("Pick: Spirit")
                .font(.system(size: 12))
                .foregroundStyle(Color.gray)
              Text("Anubis")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            }
            VStack {
              Text("Decisive map")
                .font(.system(size: 12))
                .foregroundStyle(Color.gray)
              Text("Mirage")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            }
          }
        }.padding(.all, 14)
      }.background(Color.black)
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          VStack {
            Image("IconAstralis")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 50, height: 50)
            Text(context.state.astralisPoint ?? "0").fontWeight(.bold)
          }
        }
        DynamicIslandExpandedRegion(.center) {
          VStack {
            Text("Cache")
            Text(
              Date(timeIntervalSinceNow: 0),
              style: .timer
            )
            .fontWeight(.bold)
            .monospacedDigit()
            .multilineTextAlignment(.center)
          }
        }
        DynamicIslandExpandedRegion(.trailing) {
          VStack {
            Image("IconSpirit")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: 50, height: 50)
            Text(context.state.spiritPoint ?? "0").fontWeight(.bold)
          }
        }
        DynamicIslandExpandedRegion(.bottom) {
          HStack{
            VStack {
              Text("Pick: Astralis")
                .font(.system(size: 12))
              Text("Cache")
                .fontWeight(.bold)
                .font(.system(size: 14))
            }
            VStack {
              Text("Pick: Spirit")
                .font(.system(size: 12))
                .foregroundStyle(Color.gray)
              Text("Anubis")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            }
            VStack {
              Text("Decisive map")
                .font(.system(size: 12))
                .foregroundStyle(Color.gray)
              Text("Mirage")
                .fontWeight(.bold)
                .font(.system(size: 14))
                .foregroundStyle(Color.gray)
            }
          }
        }
      } compactLeading: {
        HStack {
          Image("IconAstralis")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
          Text(context.state.astralisPoint ?? "0").fontWeight(.bold)
        }
      } compactTrailing: {
        HStack {
          Text(context.state.spiritPoint ?? "0").fontWeight(.bold)
          Image("IconSpirit")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
        }
      } minimal: {
        HStack {
          Image("IconBlast")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
        }
      }
    }
  }
}

extension MatchesLiveAttributes {
    fileprivate static var preview: MatchesLiveAttributes {
        MatchesLiveAttributes(name: "World")
    }
}

extension MatchesLiveAttributes.ContentState {
    fileprivate static var initState: MatchesLiveAttributes.ContentState {
        MatchesLiveAttributes.ContentState()
     }
}

#Preview("Notification", as: .content, using: MatchesLiveAttributes.preview) {
   MatchesLiveLiveActivity()
} contentStates: {
    MatchesLiveAttributes.ContentState.initState
}
