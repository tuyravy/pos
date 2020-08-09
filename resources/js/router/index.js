import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

/* Layout */
import Layout from '@/layout';

import saleRoutes from './modules/sales';
import customerRoutes from './modules/customer';
import stockroutes from './modules/stock';
import paymentroutes from './modules/payment';
import deliveryroutes from './modules/delivery';
import warehouseroutes from './modules/warehouse';
import projectroutes from './modules/project';
import reportsroutes from './modules/reports';
import configurationroutes from './modules/configuration';
import adminRoutes from './modules/admin';
export const constantRoutes = [
  {
    path: '/redirect',
    component: Layout,
    hidden: true,
    children: [
      {
        path: '/redirect/:path*',
        component: () => import('@/views/redirect/index'),
      },
    ],
  },
  {
    path: '/login',
    component: () => import('@/views/login/index'),
    hidden: true,
  },
  {
    path: '/auth-redirect',
    component: () => import('@/views/login/AuthRedirect'),
    hidden: true,
  },
  {
    path: '/404',
    component: () => import('@/views/error-page/404'),
    hidden: true,
  },
  {
    path: '/401',
    component: () => import('@/views/error-page/401'),
    hidden: true,
  },
  {
    path: '',
    component: Layout,
    redirect: 'dashboard',
    children: [
      {
        path: 'dashboard',
        component: () => import('@/views/dashboard/index'),
        name: 'Dashboard',
        meta: { title: 'dashboard', icon: 'dashboard', noCache: false },
      },
    ],
  },
];

export const asyncRoutes = [
  saleRoutes,
  paymentroutes,
  stockroutes,
  deliveryroutes,
  customerRoutes,
  warehouseroutes,
  projectroutes,
  reportsroutes,
  configurationroutes,
  adminRoutes,
  { path: '*', redirect: '/404', hidden: true },
];

const createRouter = () => new Router({
  // mode: 'history', // require service support
  scrollBehavior: () => ({ y: 0 }),
  routes: constantRoutes,
});

const router = createRouter();

export function resetRouter() {
  const newRouter = createRouter();
  router.matcher = newRouter.matcher; // reset router
}

export default router;
