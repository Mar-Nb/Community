import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';
import { styles } from '../../constants/Styles';

class About extends React.Component {
  render() {
    return (
      <View style={styleAbout.container}>
        <Text>Page about us!</Text>
        <TouchableHighlight
                    style={styles.button}
                    onPress={()=>this.props.navigation.navigate('Home')}>
                    <Text  style={{color:"#FFF"}}>Retour</Text>
        </TouchableHighlight>
      </View>
    );
  }
}

const styleAbout = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'space-evenly',
  },
});

export default About;