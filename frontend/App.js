import React from 'react';
import { CommunityContext } from './CommunityContext';
import AdminNavigation from './navigation/AdminNavigation';
import HomeNavigation from './navigation/HomeNavigation';
import MemberNavigation from './navigation/MemberNavigation';

class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      currentUser: null,
    }
  }

  connect = (user)=>{
    this.setState({currentUser: user})
  }

  disconnect= ()=> {
    this.setState({currentUser: null})
  }

  render() {
    return (
      <CommunityContext.Provider
        value={
          {
            currentUser: this.state.currentUser,
            connect: this.connect,
            disconnect: this.disconnect
          }
        }
      >
        {this.state.currentUser==null ?
          <HomeNavigation/>:
          this.state.currentUser.role==2?
          <AdminNavigation />:
          <MemberNavigation />
        }
      </CommunityContext.Provider>
    );
  }
}

export default App;