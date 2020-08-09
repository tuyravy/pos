<template>
  <div class="app-container">
    <span id="AlertToPaid" style="float:right;color:red">{{ AlertTopaid }}</span>
  </div>
</template>
<script>
import Resource from '@/api/resource';
import moment from 'moment';

const SaleMenResource = new Resource('Saleman');
const CustomerResource = new Resource('customer');
const SaleDailyResource = new Resource('sales');
const PaymentMothodResource = new Resource('PaymentMothod');
const DeliveryResource = new Resource('DeliveryPersion');
const ProjectNameByCusIdResource = new Resource('GetProjectName');
const DeliveryCostPublic = { DeliveryCostPublic };
export default {
  data() {
    return {
      DeliveryCostPublic: 0,
      SaleManList: {},
      PaymentMothodList: {},
      DeliveryList: {},
      ListCustomer: {},
      AlertTopaid: '',
      ProjectList: {},
      Loading: false,
      form: {
        DeliveryAddress: '',
        DeliveryNoted: '',
        DeliveryDate: this.backEndDateFormat(new Date()),
        SaleDate: this.backEndDateFormat(new Date()),
        reff_no: '',
        DeliveryCost: '',
        DeliveryBy: '',
        PaymentMothod: '',
        CusId: '',
        SystemId: '',
        ProjectId: '',
      },
      rules: {
        CusId: [
          {
            required: true,
            message: 'Customer Name is required',
            trigger: 'change',
          },
        ],
        PaymentMothod: [
          {
            required: true,
            message: 'Payment Terms is required',
            trigger: 'change',
          },
        ],
        ProjectId: [
          {
            required: true,
            message: 'Project Name is required',
            trigger: 'change',
          },
        ],
        SystemId: [
          {
            required: true,
            message: 'Sale Man is required',
            trigger: 'change',
          },
        ],
        SaleDate: [
          {
            required: true,
            message: 'Sale Date is required ',
            trigger: 'change',
          },
        ],
      },
    };
  },
  created() {
    this.getCompany();
    this.getSaleMan();
    this.getPaymentMothod();
    this.getDelivery();
    this.getProjectByCusId();
    this.HandleDeliveryCode();
  },
  methods: {
    // select data Mdoe from table
    async getCompany() {
      const { data } = await CustomerResource.list({});
      this.ListCustomer = data;
    },
    async getSaleMan() {
      const { data } = await SaleMenResource.list();
      this.SaleManList = data;
    },
    async getPaymentMothod() {
      const { data } = await PaymentMothodResource.list();
      this.PaymentMothodList = data;
    },
    async getDelivery() {
      const { data } = await DeliveryResource.list();
      this.DeliveryList = data;
    },
    async getProjectByCusId() {
      const { data } = await ProjectNameByCusIdResource.get(this.form.CusId);
      this.ProjectList = data;
    },
    HandleDeliveryCode() {
      this.DeliveryCostPublic = this.form.DeliveryCost;
      return this.DeliveryCostPublic;
    },
    handleFilterPaymentMothod() {
      this.getPaymentMothod();
    },
    handleFilter() {
      this.Loading = true;
      this.getProjectByCusId();
      this.Loading = false;
    },
    onSubmit() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          SaleDailyResource.store(this.form)
            .then(response => {
              this.$message({
                message: 'Sale has been created successfully.',
                type: 'success',
                duration: 5 * 1000,
              });
              if (
                response.data.repayment_status === 'SRPM001' ||
                response.data.repayment_status === 'SRPM003'
              ) {
                this.AlertTopaid = 'សូមកុំភ្លេចបង់ប្រាក់';
              } else {
                this.$router.push('/sales/salelist');
              }
            })
            .catch(error => {
              console.log(error);
            });
        } else {
          console.log('error submit!!');
          return false;
        }
      });
    },
    backEndDateFormat: function(date) {
      return moment(date, 'DD/MM/YYYY').format('YYYY-MM-DD');
    },
    resetForm(form) {
      this.$refs[form].resetFields();
    },
  },
};
</script>
<style scoped>
.line {
  text-align: center;
}
</style>
