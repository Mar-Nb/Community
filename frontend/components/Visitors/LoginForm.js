import React from 'react';
import { StyleSheet, Text, View, TextInput, TouchableHighlight } from 'react-native';
import {postPasswordConnection} from '../../services/server_api';
import { CommunityContext } from '../../CommunityContext';
import { styles } from '../../constants/Styles';

class LoginForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
          username: '',
          errorUsername: '',
          password: '',
          errorPassword:''
        };
    }


    async onLogin() {
        try{
          let result = await postPasswordConnection(this.state.username, this.state.password);
          if(result.status===200){
              this.setState({errorPassword:""})
              this.context.connect(result.response.user)
          }else{
            this.setState({errorPassword:"Mot de passe incorrect."})
          }
        }catch(e){
          this.setState({errorPassword:"Mot de passe incorrect."})
        }
    }

    render() {
        return (
          <View style={stylesLogin.container}>
                <TextInput
                    value={this.state.username}
                    onChangeText={(username) => this.setState({ username })}
                    label='Email'
                    placeholder="Nom d'utilisateur"
                    style={styles.input}
                    pattern={[
                      '^.{8,}$', // min 6 chars
                    ]}
                />
                {this.state.errorUsername!=""&&
                  <Text style={styles.errorText}>{this.state.errorUsername}</Text>
                }
                <TextInput
                    value={this.state.password}
                    onChangeText={(password) => this.setState({ password })}
                    label='Password'
                    placeholder="mot de passe"
                    secureTextEntry={true}
                    style={styles.input}
                />
                {this.state.errorPassword!=""&&
                  <Text style={styles.errorText}>{this.state.errorPassword}</Text>
                }
                <TouchableHighlight
                    style={styles.button}
                    onPress={this.onLogin.bind(this)}>
                    <Text  style={{color:"#FFF"}}>Se connecter</Text>
                </TouchableHighlight>
          </View>
        );
    }
}

LoginForm.contextType = CommunityContext;

export default LoginForm;

const stylesLogin = StyleSheet.create({
    container: {
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: '#FFF',
      margin:10
    }
});

