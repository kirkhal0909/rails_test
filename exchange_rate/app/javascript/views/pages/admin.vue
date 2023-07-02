<template>

  <div class="alert alert-primary mt-3 position-absolute top-0 left-50" role="alert" v-if="show">
    {{ this.info }}
  </div>
  <span class="text-label">Change USD</span>

  <form action="/admin/force_usd" method="POST" v-on:submit="change_usd_rate" v-on:submit.prevent="onSubmit">
    <div class="form-group">
      <input type="number" step="any" v-model="usd_rate" id="usd_rate" placeholder="usd rate" name="usd_rate" class="form-control">
    </div>
    <div class="form-group mt-3">
      <input type="datetime-local" v-model="expires_in" placeholder="datetime" id="datetime" name="expires_in" class="form-control">
    </div>
    <input type="hidden" name="authenticity_token" :value="csrf">
    <button type="submit" class="btn btn-primary mt-3" @click="saveParams">Change</button>
  </form>
</template>



<script>
export default {
  data() {
    return {
      show: true,
      csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
      usd_rate: localStorage.getItem('usd_rate') || 80,
      expires_in: localStorage.getItem('expires_in'),
      info: null
    }
  },
  methods: {
      saveParams() {
          localStorage.setItem('usd_rate', this.usd_rate);
          localStorage.setItem('expires_in', this.expires_in)
      },
      onSubmit(evnt) {
        axios.defaults.headers.common['X-CSRF-Token'] = this.csrf;
        axios
                    .post('/admin/force_usd', { usd_rate: this.usd_rate, expires_in: this.expires_in })
                    .then(response => (this.info = response.data));
        console.log(evnt)

        this.show = true;
        setTimeout(() => {
            this.show = false;
        }, 10000);
      }
  }
};

</script>
