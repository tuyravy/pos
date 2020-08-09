/** When your routing table is too long, you can split it into small modules**/

import Layout from '@/layout';

const stockroute = {
  path: '/delivery',
  component: Layout,
  name: 'delivery',
  alwaysShow: true, // will always show the root menu
  meta: {
    title: 'managedelivery',
    icon: 'truck',
    permissions: ['view menu delivery'],
  },
  children: [
    {
      path: 'adddelivery',
      component: () => import('@/views/delivery/AddDelivery'),
      name: 'adddelivery',
      meta: { title: 'adddeliverynote', permissions: ['manage delivery'] },
      hidden: true,
    },
    {
      path: 'deliverylist',
      component: () => import('@/views/delivery/DeliveryList'),
      name: 'deliverylist',
      meta: { title: 'deliverylist', permissions: ['manage delivery'] },
    },
  ],
};

export default stockroute;
