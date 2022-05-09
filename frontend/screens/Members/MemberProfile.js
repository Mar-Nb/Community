import React from 'react';
import { StyleSheet, Text, View, Button } from 'react-native';
import { CommunityContext } from '../../CommunityContext';

class MemberProfile extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <Text>Mon profile!</Text>
        <Button
            title="Se deconnecter"
            onPress={() =>
              this.context.disconnect()
            }
          />
      </View>
    );
  }
}

MemberProfile.contextType = CommunityContext;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default MemberProfile;