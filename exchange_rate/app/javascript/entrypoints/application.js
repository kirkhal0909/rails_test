// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log("Vite ⚡️ Rails");

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log(
  "Visit the guide for more information: ",
  "https://vite-ruby.netlify.app/guide/rails"
);

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

// Import our custom CSS
import '../scss/styles.scss'

// Import all of Bootstrap's JS
import * as bootstrap from 'bootstrap'

import { createApp } from 'vue';
const app = createApp(Layout);

import Router from '@/routes.js';
import Layout from '@/views/shared/layout.vue';
import Axios from 'axios'

// import { createApi } from '@/plugins/api';
// const Api = createApi({handler: Axios, namespace: ''});


app.use(Router)
//app.prototype.$api = Axios({ baseURL: 'http://localhost:3000' });


const axios = Axios.create({ baseURL: 'http://localhost:3000'})
//app.prototype.$api = axios;
//app.config.globalProperties.api = axios
// app.use(Api);

window.axios = axios

app.mount('#app')
