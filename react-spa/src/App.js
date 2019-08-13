import React from 'react';
import './App.css';
import ProvidersIndex from './components/ProvidersIndex.js'
import Axios from 'axios';

class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      providers: []
    };
    this.fetchProviders();
  }

  fetchProviders() {
    Axios.get('http://localhost:4000/shipping_rates').then((response) => {
      this.setState({ providers: response.data });
    }).catch((err) => {
      // In a real application, I would want to retry, and then render an error message
      console.error(err);
    })

  }

  render() {
    return (
      <div className="wrapper">
        <ProvidersIndex providers={this.state.providers}></ProvidersIndex>
      </div>
    );
  }
}

export default App;