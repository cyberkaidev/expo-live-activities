//
//  MatchesLiveHeader.m
//  myapp
//
//  Created by Kaique Dourado on 26/11/24.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

// Nesse arquivo vamos expor nosso modulo com seus métodos (startActivity, updateActivity, endActivity)

@interface RCT_EXTERN_MODULE(MatchesLiveModule, NSObject)

// Este método é chamado para informar se a classe precisa ser inicializada na fila principal
+ (bool)requiresMainQueueSetup {
  return NO;
  //Nesse caso, o módulo pode ser inicializado em um thread de fundo, o que pode melhorar a performance, pois não é necessário bloquear a fila principal.
}

RCT_EXTERN_METHOD(startActivity)
RCT_EXTERN_METHOD(updateActivity: (NSString *)astralisPoint spiritPoint:(NSString *)spiritPoint)
RCT_EXTERN_METHOD(endActivity)

@end
