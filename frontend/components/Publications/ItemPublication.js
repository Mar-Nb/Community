import React from 'react';
import { StyleSheet, Text, View, Image } from 'react-native';

class ItemPublication extends React.Component {

  render() {
    return (
      <View style={styles.container}>
        <Image  style={styles.avatar} source={require('../../assets/avatar.png')}/>
        <View style={styles.content} >
            <Text>{this.props.data.title}</Text>
            <Text>{this.props.data.content}</Text>
        </View>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flexDirection:"row",
    backgroundColor: '#fff',
  },
  avatar:{
    width: 150, 
    height: 150,
    margin: 10,
    borderColor:"black",
    borderWidth:1,
  },
  content:{
      margin: 10,
      flexWrap:"wrap",
      flex:1
  }
});

export default ItemPublication;