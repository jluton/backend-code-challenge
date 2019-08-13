import React from 'react';

class ProviderEntry extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    let { provider } = this.props;
    let rate = `${provider.formatted_rate} ${provider.rate_currency}`
    let common_rate = `${provider.USD_rate} USD`

    return (
      <li>
        <div>{provider.shipping_service_provider.name}</div>
        <div>{provider.origin}</div>
        <div>{provider.destination}</div>
        <div>{rate}</div>
        <div>{common_rate}</div>
      </li>
    );
  }
}

export default ProviderEntry;