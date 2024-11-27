import 'react-native';

// Aqui vamos typar nosso modulo MatchesLiveModule

export interface MatchesLiveModuleInterface {
  startActivity: () => Promise<void>;
  updateActivity: (astralisPoint: string, spiritPoint: string) => Promise<void>;
  endActivity: () => Promise<void>;
}

declare module 'react-native' {
  interface NativeModulesStatic {
    MatchesLiveModule: MatchesModuleInterface;
  }
}