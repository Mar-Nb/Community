import 'react-native-gesture-handler';
import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';
import Home from '../screens/Visitors/Home';
import About from '../screens/Visitors/About';
import Login from '../screens/Visitors/Login';
import Inscription from '../screens/Visitors/Inscription';

const Stack = createStackNavigator();

class HomeNavigation extends React.Component {
    render() {
      return (
        <NavigationContainer>
            <Stack.Navigator>
            <Stack.Screen
                name="Home"
                component={Home}
              />
              <Stack.Screen
                name="About"
                component={About}
              />
              <Stack.Screen
                name="Login"
                component={Login}
              />
              <Stack.Screen
                name="Inscription"
                component={Inscription}
              />
            </Stack.Navigator>
        </NavigationContainer>
      );
    }
  }

  export default HomeNavigation;