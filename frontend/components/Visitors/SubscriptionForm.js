import React from 'react';
import { StyleSheet, Text, View, TextInput, TouchableHighlight } from 'react-native';
import {postPasswordConnection, signUp} from '../../services/server_api';
import { CommunityContext } from '../../CommunityContext';
import { styles } from '../../constants/Styles';

class SubscriptionForm extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
          username: '',
          errorUsername:'',
          email: '',
          errorEmail:'',
          password: '',
          errorPassword:'',
          confirmation:'',
          errorConfirmation:'',
        };
    }

    validEmail = () => {
        const reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (reg.test(this.state.email) === true){
            this.setState({errorEmail:""})
            return true;
        }else{
            this.setState({errorEmail:"format d'email invalid."})
            return false;
        }
    }

    validPassword = () =>{
        if(this.state.password.length < 6){
            this.setState({errorPassword:"Le mot de passe doit au minimum avoir 6 caractères."})
            return false;
        }else{
            this.setState({errorPassword:""})
            return true;
        }
    }

    validConfirmation = () =>{
        if(this.state.confirmation !== this.state.password){
            this.setState({errorConfirmation:"Erreur de saisie dans la confirmation du mot de passe"})
            return false;
        }else{
            this.setState({errorConfirmation:""})
            return true;
        }
    }

    async subscribe() {
        if( this.validEmail()&&
            this.validPassword()&&
            this.validConfirmation()){
            var data= {
                name: this.state.username,
                email: this.state.email,
                password: this.state.password
            }
            try{
                let result= await signUp(data);
                if(result.status==200){
                    let resultConnect = await postPasswordConnection(data.name, data.password);
                    if(resultConnect.status===200){
                        this.setState({errorConfirmation:""})
                        this.context.connect(resultConnect.response.user)
                    }else{
                        this.setState({errorConfirmation:"Inscription réussi mais connexion échoué, rééssayez ultérieurment."})
                    }
                }else{
                    this.setState({errorConfirmation:"Erreur lors de votre inscription, rééssayez ultérieurment."})
                }
            }catch(e){
                console.log(e);
                this.setState({errorConfirmation:"Erreur lors de votre inscription, rééssayez ultérieurment."})
            }
        }
    }

    render() {
        return (
          <View style={stylesSubscription.container}>
                <Text style={styles.inputext}>Inscription</Text>
                <TextInput
                value={this.state.username}
                onChangeText={(username) => this.setState({ username })}
                label='Username'
                placeholder="Nom d'utilisateur"
                style={styles.input}
                />
                {this.state.errorUsername!=""&&
                    <Text style={styles.errorText}>{this.state.errorUsername}</Text>
                }
                <TextInput
                value={this.state.email}
                onChangeText={(email) => this.setState({ email })}
                label='Email'
                placeholder="adresse email"
                style={styles.input}
                />
                {this.state.errorEmail!=""&&
                    <Text  style={styles.errorText}>{this.state.errorEmail}</Text>
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
                <TextInput
                value={this.state.confirmation}
                onChangeText={(confirmation) => this.setState({ confirmation })}
                label='Confirmation'
                placeholder="confirmation mot de passe"
                secureTextEntry={true}
                style={styles.input}
                />
                {this.state.errorConfirmation!=""&&
                    <Text style={styles.errorText}>{this.state.errorConfirmation}</Text>
                }
                <TouchableHighlight
                style={styles.button}
                onPress={this.subscribe.bind(this)}
                >
                    <Text  style={{color:"#FFF"}}>S'inscrire</Text>
                </TouchableHighlight>
          </View>
        );
    }
}


SubscriptionForm.contextType = CommunityContext;

export default SubscriptionForm;

const stylesSubscription = StyleSheet.create({
    container: {
      flex: 1,
      alignItems: 'center',
      justifyContent: 'center',
      backgroundColor: '#FFF',
      margin:10
    }
});

