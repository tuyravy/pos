/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/warehouse',
  component: Layout,
  name: 'warehouse',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managewarehouse',
    icon: 'warehouse',
    permissions: ['view menu warehouse'],
  },
  children: [
    {
      path: 'updatewarehouse/edit/:id(\\d+)',
      component: () => import('@/views/warehouse/updatewarehouse'),
      name: 'updatewarehouse',
      meta: { title: 'updatewarehouse', permissions: ['manage warehouse'] },
      hidden: true,
    },
    {
      path: 'addwarehouse',
      component: () => import('@/views/warehouse/addwarehouse'),
      name: 'addwarehouse',
      meta: { title: 'addwarehouse', permissions: ['manage warehouse'] },
      hidden: true,
    },
    {
      path: 'warehouselist',
      component: () => import('@/views/warehouse/warehouselist'),
      name: 'warehouselist',
      meta: { title: 'warehouselist', permissions: ['manage warehouse'] },
    },
  ],
};

export default stockroute;
