import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
import ItemPublication from '../../components/Publications/ItemPublication';
import { getRessources } from '../../services/server_api';

class Publications extends React.Component {

  constructor(props) {
    super(props)
    this.state = {
      publications: [],
    }
  }

  componentDidMount(){
    this.refresh();
  }

  refresh(){
    getRessources("publication").then(result=>{
      this.setState({publications: result.response});
    });
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.title}>Welcome to Community!</Text>
        <ScrollView contentContainerStyle={styles.containerItems}>
          {this.state.publications.map((value, index)=>{
            return <ItemPublication key={index} data={value}/>
          })}
        </ScrollView>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
  },
  title:{
    textAlign:"center",
    margin:"10px"
  },
  containerItems: {
    flex: 1,
    backgroundColor: '#fff',
  },
});

export default Publications;