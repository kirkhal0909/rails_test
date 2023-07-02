import Axios from 'axios'

function Api() { return Axios }

Api.prototype.call = function(request, e) {
  let has_animation = null;
  try {
    e.classList.add('loading');
    has_animation = true;
  } catch(e) {
    has_animation = false;
  }

  return new Promise((resolve) => {
    request.then((response) => {
      if(has_animation === true) {
        e.classList.remove('loading');
        let status = null;
        if(response === true)  { status = 'success' }
        if(response === false) { status = 'failed' }

        e.classList.add(status);
        setTimeout(function(){
          e.classList.remove(status);
        }, 1000)
      }

      resolve(response);
    })
  })
}

Api.prototype.install = function (app) {
  app.plugin = this;
  app.config.globalProperties.$api = this;
}

export function createApi(args) {
  args.handler.defaults.baseURL = `localhost:3000`;

  return new Api();
}
