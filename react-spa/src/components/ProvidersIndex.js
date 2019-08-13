import React from 'react';
import ProviderEntry from './ProviderEntry.js';

function ProvidersIndex(props) {
  return (
    <div className="ProvidersIndex">
      <h2>Providers</h2>
      <ul>
        <li class="title">
          <div>Company Name</div>
          <div>Origin</div>
          <div>Destination</div>
          <div>Rate</div>
          <div>Common Rate</div>
        </li>
        {props.providers.map(provider => (
          <ProviderEntry provider={provider}/>
        ))}
      </ul>
    </div>
  );
}

export default ProvidersIndex;
