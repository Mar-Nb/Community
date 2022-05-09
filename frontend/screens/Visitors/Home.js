import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';
import { styles } from '../../constants/Styles';

class Home extends React.Component {
  render() {
    return (
      <View style={styleHome.container}>
        <Text>Welcome to Community!</Text>
        <View style={styleHome.containerButtons}>
          <TouchableHighlight
                    style={styles.button}
                    onPress={()=>this.props.navigation.navigate('About')}>
                    <Text  style={{color:"#FFF"}}>A propos</Text>
          </TouchableHighlight>
          <TouchableHighlight
                    style={styles.button}
                    onPress={()=>this.props.navigation.navigate('Login')}>
                    <Text  style={{color:"#FFF"}}>Se connecter</Text>
          </TouchableHighlight>
        </View>
      </View>
    );
  }
}

const styleHome = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'space-evenly',
  },
  containerButtons:{
    flexDirection:"row",
    width:"100%",
    justifyContent:"space-evenly"
  }
});

export default Home;