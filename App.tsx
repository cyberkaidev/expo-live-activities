import React from "react";
import { Button, SafeAreaView, NativeModules, View } from "react-native";

/*
* No NativeModules, você extrai o MatchesLiveModule
* referente ao arquivo MatchesLiveHeader.m (nossa ponte)
*/

const { MatchesLiveModule } = NativeModules;

function App() {
  return (
    <SafeAreaView style={{ flex: 1, justifyContent: "center" }}>
      <View
        style={{
          flexDirection: "column",
          justifyContent: "space-between",
          paddingHorizontal: 48,
        }}
      >
      <Button
        title="Start Activity"
        onPress={() => {
          MatchesLiveModule.startActivity();
        }}
      />
      <Button
        title="Update Activity"
        onPress={() => {
          // Essas duas props são referente ao astralisPoint e spiritPoint
          MatchesLiveModule.updateActivity(
            Math.floor(Math.random() * 13).toString(),
            Math.floor(Math.random() * 13).toString()
          );
        }}
      />
      <Button
        title="Stop Activity"
        onPress={() => {
          MatchesLiveModule.endActivity();
        }}
      />
      </View>
    </SafeAreaView>
  );
}

export default App;