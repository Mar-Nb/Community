import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import SubscriptionForm from '../../components/Visitors/SubscriptionForm';

class Inscription extends React.Component {
  render() {
    return (
      <View style={styles.container}>
        <SubscriptionForm />
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default Inscription;