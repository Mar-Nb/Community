import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import Ionicons from 'react-native-vector-icons/Ionicons';
import Publications from '../screens/Members/Publications';
import CreatePublication from '../screens/Members/CreatePublication';
import MemberProfile from '../screens/Members/MemberProfile';
import Members from '../screens/Admins/Members';

const Tab = createBottomTabNavigator();

class AdminNavigation extends React.Component {
    render() {
      return (
        <NavigationContainer>
            <Tab.Navigator screenOptions={({ route }) => ({
                tabBarIcon: ({ focused, color, size }) => {
                    let iconName;
                    if (route.name === 'Home') {
                        iconName = 'ios-list';
                    }else if (route.name === 'Members') {
                        iconName = 'ios-people';
                    }else if (route.name === 'New') {
                        iconName = 'md-create';
                    }else if (route.name === 'Profile') {
                        iconName = 'md-person';
                    }

                    // You can return any component that you like here!
                    return <Ionicons name={iconName} size={size} color={color} />;
                },
                tabBarActiveTintColor: 'tomato',
                tabBarInactiveTintColor: 'gray',
                })}
            >
                <Tab.Screen name="Home" component={Publications} />
                <Tab.Screen name="Members" component={Members} />
                <Tab.Screen name="New" component={CreatePublication} />
                <Tab.Screen name="Profile" component={MemberProfile} />
            </Tab.Navigator>
        </NavigationContainer>
      );
    }
}

export default AdminNavigation;
