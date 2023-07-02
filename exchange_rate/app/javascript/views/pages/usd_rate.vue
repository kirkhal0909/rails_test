<template>
  <div class="text-center">
    <span class="text-rate">{{ this.usd_rate }}</span>
    <p class="text-label">USD/RUB</p>
  </div>
</template>

<style>
  .text-rate {
    color: #00bcd4;
    font-size: 6em;
  }

  .text-label {
    color: mediumaquamarine;
    font-size: 3em;
  }

</style>

<script>

import consumer from "../../channels/consumer"

export default {
  data() {
    return { usd_rate: null }
  },
  methods: {
    loadData: function () {
      window.axios.get('/usd_rate/get')
      .then(({ data })=> {
      	this.usd_rate = data.usd_rate;
      })
    },
    connect_channel: function (context) {
      consumer.subscriptions.create("ActualUsdRateChannel", {
      connected() {
      },

      disconnected() {
      },

      received(data) {
        context.usd_rate = data.usd_rate;
      }
    });
    }
  },
  beforeMount() {
    this.connect_channel(this);

    this.loadData();

    setInterval(function () {
      this.loadData();
    }.bind(this), 20 * 1000);
  }
};
</script>
