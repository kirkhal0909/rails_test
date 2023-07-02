import { createWebHistory, createRouter } from 'vue-router'

import PageUsdRate from '@/views/pages/usd_rate.vue';
import PageAdmin from '@/views/pages/admin.vue';
// import MusicianShow from '@/views/musicians/show.vue';
// import Error404 from '@/views/pages/error_404.vue';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: PageUsdRate, name: 'root_path' },
    { path: '/admin', component: PageAdmin, name: 'admin_path' }
  ]
});

export default router;
