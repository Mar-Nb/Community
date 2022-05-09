import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight } from 'react-native';
import LoginForm from '../../components/Visitors/LoginForm';
import { styles } from '../../constants/Styles';
class Login extends React.Component {
  render() {
    return (
      <View style={styleLogin.container}>
        <Text>Se connecter</Text>
        <LoginForm />
        <Text>Pas encore membre?</Text>
        <TouchableHighlight
                    style={styles.button}
                    onPress={()=>this.props.navigation.navigate('Inscription')}>
                    <Text  style={{color:"#FFF"}}>S'inscrire</Text>
        </TouchableHighlight>
      </View>
    );
  }
}

const styleLogin = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});

export default Login;